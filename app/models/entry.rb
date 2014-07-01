class Entry < ActiveRecord::Base
    belongs_to :entrant
    validates :s3_uri, presence: true
    has_attached_file :video, styles: {medium: {format: 'mp4'}, thumb: {geometry: "196x110", format: 'jpg'}}, processors: [:ffmpeg]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

    def self.transfer_and_cleanup(id)
        # Get the photo to be processed
        entry = Entry.find(id)

        # final destination with the leading slashed sliced off
        paperclip_file_path = entry.video.path.slice(1..-1) 
        # temp source
        source = entry.s3_uri
        Entry.copy_and_delete paperclip_file_path, source

        entry.video.reprocess!

        entry.processed = true
        entry.save
    end

    def self.copy_and_delete(paperclip_file_path, raw_source)
        s3 = AWS::S3.new
        destination = s3.buckets[S3DirectUpload.config.bucket].objects[paperclip_file_path]
        source = s3.buckets['nutshell-360-temp'].objects[raw_source]
        source.copy_to(destination, acl: :public_read)
        source.delete
    end

    def queue_processing
        Entry.delay.transfer_and_cleanup(id)
    end

    def process
        Entry.transfer_and_cleanup(id)
    end

end
