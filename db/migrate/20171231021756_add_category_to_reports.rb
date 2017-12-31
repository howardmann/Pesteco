class AddCategoryToReports < ActiveRecord::Migration
  def change
    add_column :reports, :category, :string
    add_column :reports, :title, :string
  end
end
