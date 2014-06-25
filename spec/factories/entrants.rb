require 'faker'

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entrant do
    guid "MyString"
    name {Faker::Name.name}
    phone {Faker::PhoneNumber.phone_number}
    email {Faker::Internet.safe_email}
    birthdate "1992-06-25"
    street_address {Faker::Address.street_address}
    zipcode {Faker::Address.zip_code}
  end
end
