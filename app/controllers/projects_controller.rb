class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    project = Project.create_with_owner(params[:project], current_user)
    flash[:success] = "Project #{project.name} created sucessfuly"
    redirect_to dashboard_path
  end
end