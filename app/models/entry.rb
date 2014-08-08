class Entry < ActiveRecord::Base
    belongs_to :entrant
    validates :s3_uri, presence: true
    has_attached_file :video, {
        styles: {
            medium: {
                format: 'mp4'
            },
            thumb: {
                geometry: '196x110#',
                format: 'jpg',
                time: 1
            }
        },
        processors: [:ffmpeg],
        storage: :s3,
        s3_credentials: {
            bucket:            ENV['S3_BUCKET_NAME'],
            access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        }
    }
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

    enum rating: {
        declined:  -1,
        unjudged:  0,
        approved:  1,
        favorited: 2
    }

    default_scope { where('entrant_id IS NOT NULL') }

    paginates_per 100

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
