namespace :videos do
    desc 'Save existence status of video to each entry'
    task check_existence: :environment do
        require 'net/http'
        Entry.all.each do |entry|
            mark_video_as_present!(entry) if video_present?(entry)
        end
    end

    task reprocess: :environment do
        ActiveRecord::Base.establish_connection ENV['DATABASE_URL']
        Entry.where(processed: false, video_present: true).each do |entry|
            entry.process
        end
    end

    def video_present?(entry)
        url = URI.parse(entry.s3_uri)
        request = Net::HTTP.new(url.host, url.port)
        request.use_ssl = true
        response = request.request_head(url.path)
        puts response.code
        return response.code == '200' && !entry.video_present
    rescue Errno::ECONNRESET => error
        count ||= 1
        count += 1
        sleep(1 * count)
        retry unless count > 10

        raise "Too many retries for #{entry.s3_uri}: #{error}"
    end

    def mark_video_as_present!(entry)
        puts "Marking #{entry.s3_uri} as present"
        entry.video_present = true
        entry.save
    end
end
