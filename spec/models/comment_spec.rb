require 'rails_helper'

describe Comment, type: :model do
  describe "Associations" do
    subject { build(:comment) }

    it "should belong to a user" do
      should belong_to(:user)
    end

    it "should belong to a post" do
      should belong_to(:post)
    end
  end

  context 'empty comment' do
    let(:comment) { build(:comment, body: nil) }

    it { should validate_presence_of(:body) }
  end

  context 'comment with no user_id' do
    let(:comment) { build(:comment, user_id: nil) }

    it { should validate_presence_of(:user_id) }
  end

  context 'comment with no post_id' do
    let(:comment) { build(:comment, post_id: nil) }

    it { should validate_presence_of(:post_id) }
  end
end
