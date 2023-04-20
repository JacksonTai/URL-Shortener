class CreateShortUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :short_urls do |t|
      t.string "target_url"
      t.string "short_code"
      t.string "title_tag", default: "Untitled Page"
      t.integer "clicks", default: 0
      t.timestamps
    end
  end
end
