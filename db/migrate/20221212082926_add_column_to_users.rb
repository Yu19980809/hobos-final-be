class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :experience, :text
    add_column :users, :slogan, :string
  end
end
