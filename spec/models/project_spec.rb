require 'spec_helper'

describe Project do

  describe ".create_with_owner" do
    it 'creates a project and sets the owner to the user passed in' do
      user = create(:user)
      project_params = attributes_for(:project)

      project = Project.create_with_owner(project_params, user)

      expect(project.owner.email).to eq user.email
    end
  end

end
