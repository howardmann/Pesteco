class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date
      t.text :pdf
      t.integer :building_id

      t.timestamps null: false
    end
  end
end
