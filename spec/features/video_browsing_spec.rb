require 'spec_helper'

feature 'Video Browsing' do
    before(:each) do
        basic_auth
    end

    context 'when there are no entries' do
        before do
            Entry.delete_all
            Entrant.delete_all
        end
        scenario 'Admin tries to browse with no videos' do
            visit root_path
            page.should have_css('.no-entries')
        end
    end

    context 'when there are entries' do
        before do
            30.times do
                create(:entry)
            end
        end
        scenario 'Admin views video thumbnails' do
            visit root_path
            page.should have_css('.entry')

            Entry.order(date_created: :asc).limit(100).each do | entry |
                page.should have_css("[data-entry-id='#{entry.id}']")
                page.should have_css("[data-entry-id='#{entry.id}'] img.entry-poster")
                page.should have_content(entry.location)
            end
        end

        scenario 'Admin views individual video' do
            # Choose an entry to inspect at random
            entry_id = Entry.all.pluck(:id).sample
            entry = Entry.find(entry_id)

            visit root_path

            # Click on the entry
            find("a[data-entry-id='#{entry.id}']").click

            expect(current_path).to eq(entry_path(entry))
            page.should have_css("[data-entry-id='#{entry.id}'] video")
            page.should have_content(entry.location)
        end
    end

    context 'when there are too many entries to fit on one page' do
        before do
            200.times do
                create(:entry)
            end
        end

        scenario 'there should be no more than 100 entries on one page' do
            visit root_path
            puts page.body
            expect(page.all('.entry').count).to eql 100
        end
    end
end
