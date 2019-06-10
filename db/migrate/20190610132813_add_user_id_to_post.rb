class AddUserIdToPost < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :user_id, :integer

    execute <<-SQL
      INSERT INTO users (email, created_at, updated_at)
        VALUES ('default@example.com', '2019-06-10 12:12:12', '2019-06-10 12:12:12')
        RETURNING id;

      UPDATE posts
        SET user_id = id
        WHERE user_id IS NULL;
    SQL


    change_column_null :posts, :user_id, false
    add_foreign_key :posts, :users
  end

  def down
    remove column :posts, :user_id, :integer
    remove_foreign_key :posts, :users
  end
end
