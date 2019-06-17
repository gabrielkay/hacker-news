require 'rails_helper'

# describe "Create an account", :type => :feature do
#   it 'Creates account' do
#     visit('http://localhost:3000/users/sign_up')
#     fill_in 'Email', :with => 'example@default.com'
#     fill_in 'Password', :with => 'password'
#     fill_in 'Password confirmation', :with => 'password'
#     click_button('Sign up')
#     expect(page).to have_content('You have signed up successfully')
#   end
# end


# describe "Log into an account", :type => :feature do
#   it 'Logs in' do
#     visit('http://localhost:3000/users/sign_in')
#     fill_in 'user_email', :with => 'example@default.com'
#     fill_in 'user_password', :with => 'password'
#     click_button('Log in')
#     expect(page).to have_content('Signed in successfully.')
#   end
# end

describe "Create a post", :type => :feature do
  it 'Fills in a title and link' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit('http://localhost:3000/')
    click_link('Submit Post')
    fill_in 'post_title', :with => 'MyPost'
    fill_in 'post_link', :with => 'https://www.post.com'
    click_button('Create Post')
    expect(page).to have_content('MyPost')
    expect(page).to_not have_content('Error:')
    #would not work if a post was titled Error:
    Warden.test_reset!
  end
end


describe "Create a post", :type => :feature do
  it 'Fills in a title and link' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit('http://localhost:3000/')
    click_link('Submit Post')
    fill_in 'post_title', :with => 'MyPost'
    fill_in 'post_link', :with => 'https://www.post.com'
    click_button('Create Post')
    click_link('/posts/1')


    #would not work if a post was titled Error:
    Warden.test_reset!
  end
end
