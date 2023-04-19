class RenameShortUrlField < ActiveRecord::Migration[7.0]
  def change
    rename_column :short_urls, :short_url, :short_code
  end
end
