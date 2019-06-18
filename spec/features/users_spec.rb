require 'rails_helper'

describe "Create an account", :type => :feature do
  it 'Creates account' do
    visit('http://localhost:3000/users/sign_up')
    fill_in 'Email', :with => 'example@default.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button('Sign up')
    expect(page).to have_content('You have signed up successfully')
  end
end


describe "Log into an account", :type => :feature do

  before do
    user = FactoryBot.create(:user)
  end

  it 'Logs in' do
    visit('http://localhost:3000/users/sign_in')
    fill_in 'user_email', :with => 'example@default.com'
    fill_in 'user_password', :with => 'password'
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end
end

describe "Create a post", :type => :feature do

  before do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  it 'Fills in a title and link' do
    visit('http://localhost:3000/')
    click_link('Submit Post')
    fill_in 'post_title', :with => 'MyPost'
    fill_in 'post_link', :with => 'https://www.post.com'
    click_button('Create Post')
    expect(page).to have_content('MyPost')
    expect(page).to_not have_content('Error:')
    #would not work if a post was titled Error:
  end
end


describe "Create a comment", :type => :feature do

  before do
    user = FactoryBot.create(:user, id: 1)
    login_as(user, :scope => :user)
  end

  let!(:post) { create(:post) }

  it 'Fills in a title and link' do
    visit('http://localhost:3000/')
    click_link('comments')
    fill_in 'comment_body', :with => 'MyComment'
    click_button('Create Comment')
    expect(page).to have_content('MyComment')
    expect(page).to_not have_content('Error:')
    #would not work if a comment was named Error:
  end
end
