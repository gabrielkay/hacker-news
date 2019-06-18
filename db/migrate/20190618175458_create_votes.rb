class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type
      #1 for upvote, -1 for downvote
      t.boolean :vote_type

      t.timestamps
    end
  end
end
