require 'spec_helper'

feature 'Viewing the homepage' do
  scenario 'a visitor sees information about the app' do
    visit root_path

    expect(page).to have_title 'ProjectTracker'
    expect(page).to have_css 'section.intro'
  end
end