require 'spec_helper'

feature 'A user can sign in' do
  scenario 'with a valid email and password' do
    user = create(:user)
    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_css 'h2', text: 'Dashboard'
    expect(page).to have_css 'p.greeting', text: "Welcome, #{user.email}"
  end
end