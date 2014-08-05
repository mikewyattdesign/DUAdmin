namespace :videos do
    desc 'Save existence status of video to each entry'
    task check_existence: :environment do
        require 'net/http'
        Entry.all.each do |entry|
            url = URI.parse(entry.s3_uri)
            request = Net::HTTP.new(url.host, url.port)
            request.use_ssl = true
            response = request.request_head(url.path)
            puts response.code
            if response.code == 200 && !entry.video_present
                puts "Marking #{entry.guid} as present"
                entry.video_present = true
                entry.save
            end
        end
    end
end