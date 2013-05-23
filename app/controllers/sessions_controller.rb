class SessionsController < Clearance::SessionsController
  protected
  
  def url_after_create
    dashboard_path
  end

  def url_after_destroy
    root_path
  end
end