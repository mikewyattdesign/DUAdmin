require 'spec_helper'

describe Entry do
  it 'is valid with an s3_uri' do
    expect(build(:entry)).to be_valid
  end
  it 'is invalid without an s3_uri' do
    expect(build(:entry, s3_uri: nil)).to have_at_least(1).errors_on(:s3_uri)
  end
  it 'responds to an entrant' do
    expect(build(:entry)).to respond_to(:entrant)
  end
  it 'defaults to not being processed' do
    expect(build(:entry).processed).to be_falsey
  end

  it 'responds to a video' do
    expect(build(:entry)).to respond_to(:video)
  end

  it 'can generate a thumbnail' do
    entry = create(:entry)
    entry.process
    expect(entry.video.url(:thumb)).to_not be_nil
  end
end
