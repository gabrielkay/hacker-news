require 'rails_helper'

describe Post, type: :model do
  describe "Associations" do
    context 'generic post' do
      it "should belong to a user" do
        subject do
          post = build(:post)
        end
        should belong_to(:user)
      end
    end
  end

  context 'post with no link' do
    it "can't create post without link" do
      post = build(:post, link: nil)
      post.valid?
      expect(post.errors[:base]).to include("You must submit a valid URL. You entered: ")
    end
  end
end
