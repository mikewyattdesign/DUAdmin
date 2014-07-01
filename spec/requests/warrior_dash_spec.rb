require 'spec_helper'

def json(body)
    JSON.parse(body, symbolize_names: true)
end

describe 'Warrior Dash API' do
    it 'Accepts a single submission' do
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

        post '/api/warriordash',
        data.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

        # expect a 201 status code
        expect(response.status).to eq(201)

        # get response
        result = json(response.body)

        # expect entry to come back
        expect(result[:entries].length).to eq(1)

        # expect entrant to come back
        expect(result[:entrants].length).to eq(1)
    end
end