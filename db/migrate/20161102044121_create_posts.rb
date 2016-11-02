class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.text :body
      t.text :attachments, :array => true, :default => []
      t.string :category

      t.timestamps null: false
    end
  end
end
