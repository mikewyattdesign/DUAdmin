# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    entrant nil
    entrant_guid "MyString"
    s3_uri "MyString"
    date_created "2014-06-25"
  end
end
