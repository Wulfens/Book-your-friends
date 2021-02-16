class ChangeEndDateToBeDatetimeInLocations < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :end_date, :datetime
  end
end
