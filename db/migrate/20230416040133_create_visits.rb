class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :originating_geolocation
      t.string :string
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
