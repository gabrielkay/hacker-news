require 'rails_helper'

describe Post, type: :model do
  describe 'Associations' do
    subject { build(:post) }

    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  context 'post with no title' do
    let(:post) { build(:post, title: nil) }

    it { should validate_presence_of(:title) }
  end
end
