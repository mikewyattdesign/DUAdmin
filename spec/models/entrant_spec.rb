require 'spec_helper'

describe Entrant do
  # Name
  it 'is valid with a name' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:entrant, name: nil)).to have(1).errors_on(:name)
  end

  # Phone Number
  it 'is valid with a phone number' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a phone number' do
    expect(build(:entrant, phone: nil)).to have_at_least(1).errors_on(:phone)
  end
  it 'is invalid with an invalid phone number' do
    expect(build(:entrant, phone: "1234")).to have(1).errors_on(:phone)
  end

  # Email
  it 'is valid with a valid email' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without an email' do
    expect(build(:entrant, email: nil)).to have_at_least(1).errors_on(:email)
  end

  # Birthdate
  it 'is valid with a valid date of birth' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a date of birth' do
    expect(build(:entrant, birthdate: nil)).to have(1).errors_on(:birthdate)
  end
  it 'knows when it is underage' do 
    expect(build(:entrant, birthdate: Date.today).underage?).to be_truthy
  end

  it 'knows when it is not underage' do
    expect(build(:entrant).underage?).to be_falsey
  end

  # Street Address
  it 'is valid with a street address' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a street address' do
    expect(build(:entrant, street_address: nil)).to have(1).errors_on(:street_address)
  end

  # Zipcode
  it 'is valid with a zipcode' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a zipcode' do 
    expect(build(:entrant, zipcode: nil)).to have(1).errors_on(:zipcode)
  end

  it 'responds to entries' do
    expect(build(:entrant)).to respond_to(:entries)
  end
end
