class EntriesController < ApplicationController
    def index
        @entries = Entry.all.includes(:entrant)
        @numEntries = @entries.count
    end

    def show
        if Entry.where(id: params[:id])
            @entry = Entry.includes(:entrant).find(params[:id])
            @entries = Entry.where.not(id: params[:id]).limit(10)
        else
            redirect_to root, notice: "Couldn't find entry #{params[:id]}. Perhaps it's been deleted."
        end
    end
end