require 'spec_helper'

describe 'Warrior Dash API' do
    it 'Accepts a single submission' do
        post '/api/warriordash'

        # expect a 200 status code
        expect(response).to be_success

    end
end