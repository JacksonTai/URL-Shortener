class RenameUrl < ActiveRecord::Migration[7.0]
  def change
    rename_table :urls, :short_url
  end
end
