class AddStatusToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :status, :string, default: "Pending"
  end
end
