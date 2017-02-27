class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.date :date_report
      t.text :description
      t.date :date_respond
      t.text :response
      t.string :technician
      t.integer :building_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
