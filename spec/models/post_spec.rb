require 'rails_helper'

describe Post, type: :model do
  describe "Associations" do
    it "should belong to user" do
      post = build(:post)
      should belong_to(:user)
    end
  end
  it "can't create post without link" do
    post = build(:post, link: nil)
    post.valid?
    expect(post.errors[:base]).to include("You must submit a valid URL. You entered: ")
  end
end
