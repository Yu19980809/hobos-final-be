class CreateShowComedians < ActiveRecord::Migration[7.0]
  def change
    create_table :show_comedians do |t|
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
