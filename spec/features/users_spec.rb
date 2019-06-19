require 'rails_helper'

describe "Create an account", :type => :feature do
  it 'Creates account' do
    visit('/users/sign_up')
    fill_in 'Email', with: 'example@default.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    expect {
      click_button('Sign up')
    }.to change {
      User.count
    }.by(1)
    expect(page).to have_content('You have signed up successfully')
  end
end


describe "Log into an account", :type => :feature do

  let!(:user) { FactoryBot.create(:user, email: "example@default.com") }

  it 'Logs in' do
    visit('/users/sign_in')
    fill_in 'user_email', with: 'example@default.com'
    fill_in 'user_password', with: 'password'
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end
end

describe "Create a post", :type => :feature do

  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  it 'Fills in a title and link' do
    visit('/')
    click_link('Submit Post')
    fill_in 'post_title', with: 'MyPost'
    fill_in 'post_link', with: 'https://www.post.com'
    expect {
      click_button('Create Post')
    }.to change {
      Post.count
    }.by(1)
    expect(page).to have_content('MyPost')
    expect(page).to_not have_content('Error:')
    #would not work if a post was titled Error:
  end
end


describe "Create a comment on a post", :type => :feature do

  let!(:post) { create(:post) }
  let!(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  it 'Fills in a title and link' do
    visit('/')
    click_link('comments')
    fill_in 'comment_body', with: 'MyComment'
    expect {
      click_button('Create Comment')
    }.to change {
      Comment.count
    }.by(1)
    expect(page).to have_content('MyComment')
    expect(page).to_not have_content('Error:')
    #would not work if a comment was named Error:
  end
end

describe "Create a comment on a comment", :type => :feature do

  let!(:comment_comment) { create(:comment_comment) }
  let!(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  it 'Fills in a title and link' do
    visit('/')
    click_link('comments')
    click_button('reply')
    fill_in 'comment_body', with: 'ReplyComment'
    expect {
      click_button('Create Comment')
    }.to change {
      Comment.count
    }.by(1)
    expect(page).to_not have_content('Error:')
    #would not work if a comment was named Error:
  end
end
