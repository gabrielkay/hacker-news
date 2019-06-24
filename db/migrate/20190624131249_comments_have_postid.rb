class CommentsHavePostid < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DELETE FROM comments;
    SQL

    add_column :comments, :parent_post_id, :integer, null: false
  end

  def down
    remove_column :comments, :parent_post_id, :integer
  end
end
