class EntriesController < ApplicationController
    def index
        @entries = Entry.all.includes(:entrant)
        @numEntries = @entries.count
    end
end