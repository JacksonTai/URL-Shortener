class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :target_url
      t.string :short_url
      t.string :title_tag
      t.string :geolocation
      t.integer :clicks, default: 0

      t.timestamps
    end
  end
end
