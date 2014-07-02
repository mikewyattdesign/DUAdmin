class AddRatingToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :rating, :integer, default: 0
  end
end
