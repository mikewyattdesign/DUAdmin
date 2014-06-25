class Entry < ActiveRecord::Base
  belongs_to :entrant
  validates :s3_uri, presence: true
end
