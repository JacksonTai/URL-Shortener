class DropGeolocationFromShortUrls < ActiveRecord::Migration[7.0]
  def change
    remove_column :short_urls, :geolocation
  end
end
