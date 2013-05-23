class Project < ActiveRecord::Base
  attr_accessible :name

  belongs_to :owner, class_name: 'User'
end
