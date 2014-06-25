class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :entrant, index: true
      t.string :entrant_guid
      t.string :s3_uri
      t.date :date_created
      t.attachment :video
      t.boolean :processed, default: false

      t.timestamps
    end
  end
end
