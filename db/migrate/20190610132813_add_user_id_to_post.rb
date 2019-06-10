class AddUserIdToPost < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :user_id, :integer

    execute <<-SQL
      DELETE FROM posts;
    SQL

    change_column_null :posts, :user_id, false
    add_foreign_key :posts, :users, on_delete: :cascade
  end

  def down
    remove_foreign_key :posts, :users
    remove_column :posts, :user_id, :integer
  end
end
