require 'spec_helper'

describe EntryForm do
    it 'is valid with a single guid' do
        data = {guid1: {}}
        expect(EntryForm.new(data)).to be_valid
    end

    it 'is invalid with no entries' do
        data = {}
        expect(EntryForm.new(data)).to_not be_valid
    end

    it 'is valid with multiple guids' do
        data = {guid1: {}, guid2: {}}
        expect(EntryForm.new(data)).to be_valid
    end
    it 'can create an entrant from a submission' do
        guid = "GUID1"
        entry = build(:entry, entrant_guid: guid)
        entrant = build(:entrant, guid: guid)
        data = {}
        data["#{guid}"] = {
            entry: {
                s3_uri: entry.s3_uri,
                date_created: entry.date_created
                },
            entrant: {
                name: entrant.name,
                phone: entrant.phone,
                email: entrant.email,
                birthdate: entrant.birthdate,
                street_address: entrant.street_address,
                zipcode: entrant.zipcode
            }
        }
        my_submission = EntryForm.new(data)
        expect{my_submission.process}.to change{Entrant.count}.by(1)
        
    end

    it 'can create an entry from a submission' do
        guid = "GUID2"
        entry = build(:entry, entrant_guid: guid)
        entrant = build(:entrant, guid: guid)
        data = {}
        data["#{guid}"] = {
            entry: {
                s3_uri: entry.s3_uri,
                date_created: entry.date_created
                },
            entrant: {
                name: entrant.name,
                phone: entrant.phone,
                email: entrant.email,
                birthdate: entrant.birthdate,
                street_address: entrant.street_address,
                zipcode: entrant.zipcode
            }
        }
        my_submission = EntryForm.new(data)
        expect{my_submission.process}.to change{Entry.count}.by(1)
        
    end

    it 'can create multiple entries from a submission' do
        data = {}
        (3..5).to_a.each do |index|
            guid = "GUID#{index}"
            entry = build(:entry, entrant_guid: guid)
            entrant = build(:entrant, guid: guid)
            data["#{guid}"] = {
                entry: {
                    s3_uri: entry.s3_uri,
                    date_created: entry.date_created
                    },
                entrant: {
                    name: entrant.name,
                    phone: entrant.phone,
                    email: entrant.email,
                    birthdate: entrant.birthdate,
                    street_address: entrant.street_address,
                    zipcode: entrant.zipcode
                }
            }
        end
        my_submission = EntryForm.new(data)
        expect{my_submission.process}.to change{Entrant.count}.by(3)
    end 
    it 'can create multiple entrants from a submission' do
        data = {}
        (6..8).to_a.each do |index|
            guid = "GUID#{index}"
            entry = build(:entry, entrant_guid: guid)
            entrant = build(:entrant, guid: guid)
            data["#{guid}"] = {
                entry: {
                    s3_uri: entry.s3_uri,
                    date_created: entry.date_created
                    },
                entrant: {
                    name: entrant.name,
                    phone: entrant.phone,
                    email: entrant.email,
                    birthdate: entrant.birthdate,
                    street_address: entrant.street_address,
                    zipcode: entrant.zipcode
                }
            }
        end
        my_submission = EntryForm.new(data)
        expect{my_submission.process}.to change{Entry.count}.by(3)
    end 
end