class AddClientAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :client_admin, :boolean, :default => false
  end
end
