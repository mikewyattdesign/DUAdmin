class EntriesController < ApplicationController
    def index
        @entries = Entry.all.includes(:entrant).order(date_created: :desc)
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

    def rate
        if Entry.where(id: params[:id])
            @entry = Entry.includes(:entrant).find(params[:id])
            @entry.update(rating: params[:rating])
            respond_to do |format|
                format.html{
                    redirect_to @entry, notice: "Entry #{@entry.rating}"
                }
            end
        end
    end
    def decline
        if Entry.where(id: params[:id])
            @entry = Entry.includes(:entrant).find(params[:id])
            @entry.declined!
            respond_to do |format|
                format.html{
                    redirect_to @entry, notice: "Entry #{@entry.rating}"
                }
            end
        end
    end
    def approve
        if Entry.where(id: params[:id])
            @entry = Entry.includes(:entrant).find(params[:id])
            @entry.approved!
            respond_to do |format|
                format.html{
                    redirect_to @entry, notice: "Entry #{@entry.rating}"
                }
            end
        end
    end
    def favorite
        if Entry.where(id: params[:id])
            @entry = Entry.includes(:entrant).find(params[:id])
            @entry.favorited!
            respond_to do |format|
                format.html{
                    redirect_to @entry, notice: "Entry #{@entry.rating}"
                }
            end
        end
    end
end