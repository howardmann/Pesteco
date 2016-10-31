class RemoveReportsFromBuildings < ActiveRecord::Migration
  def change
    remove_column :buildings, :reports, :text
  end
end
