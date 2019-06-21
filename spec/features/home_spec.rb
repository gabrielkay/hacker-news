require 'spec_helper'
describe 'GET homepage', type: :feature do
  it 'Loads the homepage' do
    visit('/')
    expect(page.title).to have_content('HackerNews')
  end
end

describe "GET '/login", type: :feature do
  it 'shows a login form' do
    visit('/users/sign_in')
    expect(page).to have_content('Log in')
  end
end
