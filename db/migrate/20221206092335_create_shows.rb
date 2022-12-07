class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :address
      t.string :poster_url
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
