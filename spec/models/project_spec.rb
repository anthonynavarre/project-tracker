require 'spec_helper'

describe Project, "#owner=" do
  it 'assigns the owner of the project to user that creates the project' do
    user = create(:user)
    project = create(:project)
    project.owner = user

    expect(project.owner.email).to eq user.email
  end
end
