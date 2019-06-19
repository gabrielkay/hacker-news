class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      #1 for upvote, -1 for downvote
      t.integer :vote_type, null: false

      t.timestamps
    end
  end
end
