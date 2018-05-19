class HomeController < ApplicationController
    before_action :authenticate_user!
    
  def dashboard
    @permit = Permit.where(:adviserStatus => "pending")
  end
end
