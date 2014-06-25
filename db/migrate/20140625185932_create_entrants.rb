class CreateEntrants < ActiveRecord::Migration
  def change
    create_table :entrants do |t|
      t.string :guid
      t.string :name
      t.string :phone
      t.string :email
      t.date :birthdate
      t.string :street_address
      t.string :zipcode

      t.timestamps
    end
  end
end
