# Add boolean column to track whether the video is present on S3 or not
class AddVideoPresentToEntries < ActiveRecord::Migration
    def change
        add_column :entries, :video_present, :boolean, default: false
    end
end
