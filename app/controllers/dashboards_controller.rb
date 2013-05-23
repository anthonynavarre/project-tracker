class DashboardsController < ApplicationController
  before_filter :authorize
  
  def show
    @projects = Project.all
  end
end