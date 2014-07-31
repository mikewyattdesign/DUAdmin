class EntriesController < ApplicationController
    http_basic_authenticate_with name: 'group360', password: 'z2#j$n4d#AXEFWWS9c4x'

    def index
        if params[:rating]
            if Entry.ratings.include?(params[:rating])
                rating = Entry.ratings["#{params[:rating]}"]
                @entries = Entry.where(rating: rating).includes(:entrant).order(created_at: :desc)
            else
                @entries = Entry.all
            end
            # render text: params[:rating]
        else
            @entries = Entry.all.includes(:entrant).order(created_at: :desc)
        end
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
