class AddColumnToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :description, :text
  end
end
