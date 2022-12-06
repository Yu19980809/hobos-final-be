class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comedian, null: false, foreign_key: { to_table: :users }
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
