class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.references :post, foreign_key: true
      t.string :source_type
      t.integer :source_id
      t.timestamps
    end
  end
end
