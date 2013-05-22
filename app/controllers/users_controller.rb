class UsersController < Clearance::UsersController
  protected

  def url_after_create
    dashboard_path
  end
end