class ChangeStartDateToBeDatetimeInLocations < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :start_date, :datetime
  end
end
