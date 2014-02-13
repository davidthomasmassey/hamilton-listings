class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :genre
      t.string :title
      t.string :location
      t.datetime :date
      t.string :info

      t.timestamps
    end
  end
end
