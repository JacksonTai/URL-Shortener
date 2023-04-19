class DropStringFieldFromVisit < ActiveRecord::Migration[7.0]
  def change
    remove_column :visits, :string
  end
end
