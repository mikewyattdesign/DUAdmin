require "spec_helper"

feature "Video Rating" do
    before(:each) do
        basic_auth
    end

    before {
        30.times do
            create(:entry)
        end
        @entry = Entry.find(Entry.all.pluck(:id).sample)
    }
    scenario "Admin Approves a Video" do
        visit entry_path(@entry)
        within("article.entry[data-entry-id='#{@entry.id}'] .actions") do
            click_button("Approve")
        end

        page.should have_content "Entry approved"
        @entry.reload
        expect(@entry.approved?).to be_truthy

    end

    scenario "Admin Declines a Video" do
        visit entry_path(@entry)
        within("article.entry[data-entry-id='#{@entry.id}'] .actions") do
            click_button("Decline")
        end

        page.should have_content "Entry declined"
        @entry.reload
        expect(@entry.declined?).to be_truthy
    end

    scenario "Admin Favorites a Video" do
        visit entry_path(@entry)
        within("article.entry[data-entry-id='#{@entry.id}'] .actions") do
            click_button("Favorite")
        end

        page.should have_content "Entry favorited"
        @entry.reload
        expect(@entry.favorited?).to be_truthy
    end
end
