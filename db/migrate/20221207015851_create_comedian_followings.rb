class CreateComedianFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :comedian_followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comedian, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
