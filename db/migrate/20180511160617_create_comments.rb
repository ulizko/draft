class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :content, null: false
      t.belongs_to :category
      t.belongs_to :post

      t.timestamps
    end
  end
end
