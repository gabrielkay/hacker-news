require 'rails_helper'

describe Post, type: :model do
  describe "Associations" do
    subject { build(:post) }

    it "should belong to a user" do
      should belong_to(:user)
    end
  end

  context 'post with no link' do
    let(:post) { build(:post, link: nil) }

    it "can't create post without link" do
      post.valid?
      expect(post.errors[:base]).to include("You must submit a valid URL. You entered: ")
    end
  end
end
