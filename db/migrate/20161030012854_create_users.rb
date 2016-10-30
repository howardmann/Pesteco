class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :password_digest
      t.string :name
      t.string :mobile
      t.boolean :admin, :default => false
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
