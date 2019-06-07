class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :link
      t.integer :user_id
      t.timestamps
    end
  end
end
