class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :parent_comment_id
      t.string :body, null: false
      t.timestamps
    end
  end
end
