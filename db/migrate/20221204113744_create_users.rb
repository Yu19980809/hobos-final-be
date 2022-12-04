class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :name
      t.string :role
      t.string :avatar_url

      t.timestamps
    end
  end
end
