class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard_1
  end

  def dashboard_2
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    # render :layout => "layout_2"
    render :layout => "appSO"
  end

  def dashboard_4_1
  end

  def student_org_dashboard
    render :layout => "appSO"
  end

end
