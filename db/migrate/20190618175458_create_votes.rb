class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type
      #True for upvote, False for downvote
      t.boolean :vote_type

      t.timestamps
    end
  end
end
