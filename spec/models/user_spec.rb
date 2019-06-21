require 'rails_helper'

describe User, type: :model do
  describe 'Associations' do
    subject { build(:user) }

    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

  it { should validate_presence_of(:email) }
end
