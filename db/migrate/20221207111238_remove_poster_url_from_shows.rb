class RemovePosterUrlFromShows < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :poster_url, :string
  end
end
