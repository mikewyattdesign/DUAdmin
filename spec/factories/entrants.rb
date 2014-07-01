require 'faker'

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entrant do
    guid {SecureRandom.uuid}
    name {Faker::Name.name}
    phone {Faker::PhoneNumber.phone_number}
    email {Faker::Internet.safe_email}
    birthdate { 21.years.ago }
    street_address {Faker::Address.street_address}
    zipcode {Faker::Address.zip_code}
  end
end
