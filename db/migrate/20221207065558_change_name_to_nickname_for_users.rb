class ChangeNameToNicknameForUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :nickname
  end
end
