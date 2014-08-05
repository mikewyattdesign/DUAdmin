require 'faker'

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    entrant
    entrant_guid { entrant.guid }
    sequence(:s3_uri){|n| "https://s3.amazonaws.com/shocktop-du-staging/test/IMG_000#{n%3}.MOV"}
    date_created { 1.day.ago }
    location { Faker::Address.city }
    video_present true
  end
end
