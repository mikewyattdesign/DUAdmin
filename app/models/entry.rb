class Entry < ActiveRecord::Base
    belongs_to :entrant
    validates :s3_uri, presence: true
    has_attached_file :video, styles: {medium: {format: 'mp4'}, thumb: {geometry: "196x110#", format: 'jpg', time: 1}}, processors: [:ffmpeg]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

    def process
        self.video = s3_uri
        video.reprocess!
        self.processed = true
        save
    end

    def queue_processing
        delay.process
    end


end
