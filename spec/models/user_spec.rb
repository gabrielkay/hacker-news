require 'rails_helper'

describe User, type: :model do
  describe "Associations" do
    it { should have_many(:posts) }
  end

  it { should validate_presence_of(:email) }
end
