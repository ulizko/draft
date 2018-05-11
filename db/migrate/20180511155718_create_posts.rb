class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :content
      t.belongs_to :category

      t.timestamps
    end
  end
end
