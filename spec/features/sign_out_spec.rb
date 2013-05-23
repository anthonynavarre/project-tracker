require 'spec_helper'

feature 'Signing out' do
  scenario 'redirects user to root path' do
    user = create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'Sign out'

    expect(page).to have_css 'h2', text: 'Sign in'
  end
end