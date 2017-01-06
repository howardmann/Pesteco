class CreateBuildingsUsers < ActiveRecord::Migration
  def change
    create_table :buildings_users do |t|
      t.integer :building_id
      t.integer :user_id
    end
  end
end
