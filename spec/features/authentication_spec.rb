require 'spec_helper'

feature 'authentication' do
    context 'when authenticated' do
        scenario 'user receives 200 status code' do
            basic_auth
            visit root_path
            expect(page.status_code).to eq 200
        end
    end

    context 'when not authenticated' do
        scenario 'user receives 401 status code' do
            visit root_path
            expect(page.status_code).to eq 401
        end
    end
end
