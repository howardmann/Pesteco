class AddGroupIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :group_id, :integer
  end
end
