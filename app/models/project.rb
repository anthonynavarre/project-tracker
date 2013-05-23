class Project < ActiveRecord::Base
  attr_accessible :name, :owner_id

  has_many :collaborators, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  def self.create_with_owner(project_params, user)
    project = Project.new(project_params)
    project.set_owner project, user
    project.save
    project
  end
  
  def set_owner(project, user)
    project.owner = user
  end
end
