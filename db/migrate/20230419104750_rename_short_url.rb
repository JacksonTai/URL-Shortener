class RenameShortUrl < ActiveRecord::Migration[7.0]
  def change
    rename_table :short_url, :short_urls
  end
end
