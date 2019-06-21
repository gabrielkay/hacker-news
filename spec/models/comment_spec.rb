require 'rails_helper'

describe Comment, type: :model do
  describe 'Associations' do
    subject { build(:comment) }

    it { should belong_to(:user) }
  end

  context 'empty comment' do
    let(:comment) { build(:comment, body: nil) }

    it { should validate_presence_of(:body) }
  end

  context 'comment with no user_id' do
    let(:comment) { build(:comment, user_id: nil) }

    it { should validate_presence_of(:user_id) }
  end
end
