require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "Associations for vote on post" do
    subject { build(:up_vote) }

    it { should belong_to(:user) }
    it { should belong_to(:votable) }
  end

  describe "Associations for vote on comment" do
    subject { build(:up_vote_comment) }

    it { should belong_to(:user) }
    it { should belong_to(:votable) }
  end

  context 'Has user_id' do
    let(:up_vote) { build(:up_vote, user_id: nil) }

    it { should validate_presence_of(:user_id) }
  end
end

