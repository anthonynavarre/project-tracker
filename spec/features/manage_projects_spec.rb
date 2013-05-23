require 'spec_helper'

feature 'Manage project' do
  scenario 'create a new project' do
    user = create(:user)
    sign_in_as user

    create_project 'Example Project'

    user_should_see_project 'Example Project'
    user_should_see_project_owner_email user.email
  end

  scenario 'add collaborators to a project' do
    user = create(:user)
    sign_in_as user
    create_project 'Collaborator Test'

    click_link 'Collaborator Test'
    click_link 'Add a collaborator to this project'

    fill_in 'Email', with: 'collaborator@example.com'
    click_button 'Add collaborator'

    expect(page).to have_css '[data-role="project-collaborator"]', text: 'collaborator@example.com'
  end

  def sign_in_as(user)
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def create_project(name)
    click_link 'Create a new project'
    fill_in 'Name', with: name
    click_button 'Create project'
  end

  def user_should_see_project(name)
    expect(page).to have_css 'h2', text: 'Example Project'
  end

  def user_should_see_project_owner_email(email)
    expect(page).to have_css '[data-role="project-owner"]', text: email 
  end
end