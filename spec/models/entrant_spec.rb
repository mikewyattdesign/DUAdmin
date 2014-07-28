require 'spec_helper'

describe Entrant do
  # Name
  it 'is valid with a name' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:entrant, name: nil)).to have(1).errors_on(:name)
  end

  # Email
  it 'is valid with a valid email' do
    expect(build(:entrant)).to be_valid
  end
  it 'is invalid without an email' do
    expect(build(:entrant, email: nil)).to have_at_least(1).errors_on(:email)
  end

  # Birthdate
  it 'knows when it is underage' do 
    expect(build(:entrant, birthdate: Date.today).underage?).to be_truthy
  end
  it 'knows when it is not underage' do
    expect(build(:entrant).underage?).to be_falsey
  end

  it 'responds to entries' do
    expect(build(:entrant)).to respond_to(:entries)
  end
end
