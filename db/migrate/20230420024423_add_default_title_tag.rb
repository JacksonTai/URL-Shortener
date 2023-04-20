class AddDefaultTitleTag < ActiveRecord::Migration[7.0]
  def change
    change_column :short_urls, :title_tag, :string, default: 'Untitled Page'
  end
end
