require "spec_helper"

feature "Video Browsing" do
    context "There are no entries" do
        before {
            Entry.delete_all
            Entrant.delete_all
        }
        scenario "Admin tries to browse with no videos" do
            visit root_path
            page.should have_css('.no-entries')
        end
    end

    context "There are entries" do
        before {
            30.times do
                create(:entry)
            end
        }
        scenario "Admin views video thumbnails" do
            visit root_path
            page.should have_css('.entry')

            Entry.order(date_created: :asc).limit(100).each do | entry |
                page.should have_css("[data-entry-id='#{entry.id}']")
                page.should have_css("[data-entry-id='#{entry.id}'] img.entry-poster")
            end
        end
    end
end