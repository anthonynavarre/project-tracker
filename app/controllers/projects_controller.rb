class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    @project.save
    flash[:notice] = "Project #{@project.name} created sucessfuly"
    redirect_to dashboard_path
  end
end