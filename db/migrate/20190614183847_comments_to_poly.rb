class CommentsToPoly < ActiveRecord::Migration[5.2]
  def up
    remove_column :comments, :post_id
    remove_column :comments, :comment_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end

  def down
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
    add_column :comments, :post_id, :integer
    add_column :comments, :comment_id, :integer
  end
end
