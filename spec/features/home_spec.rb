require 'spec_helper'
describe "GET homepage", :type => :feature  do
  it 'Loads the homepage' do
    visit('http://localhost:3000/')
    expect(page.title).to have_content("HackerNews")
    puts "has Hacker in title"
  end
end

describe "GET '/login", :type => :feature do
  it 'shows a login form' do
    visit('http://localhost:3000/users/sign_in')
    expect(page).to have_content("Log in")
    puts 'Sign in page says Log In'
    puts User.all
  end
end
