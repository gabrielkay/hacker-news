require 'rails_helper'

describe User, type: :model do
  describe "Associations" do
    it { should have_many(:posts) }
  end

  it "can not create account without email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
