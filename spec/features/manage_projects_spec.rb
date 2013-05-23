require 'spec_helper'

feature 'Manage project' do
  scenario 'create a new project' do
    user = create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'Create a new project'
    fill_in 'Name', with: 'Example Project'
    click_button 'Create project'

    expect(page).to have_css 'h2', text: 'Example Project'
    expect(page).to have_css '[data-role="project-owner"]', text: user.email 
  end
end