require 'spec_helper'

feature 'A visitor can sign up' do
  scenario 'with an email and password' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'example'
    click_button 'Sign up'

    expect(page).to have_css 'p.greeting', text: 'Welcome, user@example.com'
  end
end