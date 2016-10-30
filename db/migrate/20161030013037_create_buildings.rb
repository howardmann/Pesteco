class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :address
      t.text :reports, :array => true, :default => []
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
