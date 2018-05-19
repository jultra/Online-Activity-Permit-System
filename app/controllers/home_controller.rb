class HomeController < ApplicationController
    before_action :authenticate_user!
    
  def dashboard
    if current_user.is_adviser?
        @permit = Permit.where(:adviserStatus => "pending")
    elsif current_user.is_osa?
        @permit = Permit.where(:osaStatus => "pending")
    elsif current_user.is_facility?
        @permit = Permit.where(:facilityStatus => "pending")
    elsif current_user.is_sao?
        @permit = Permit.where(:saoStatus => "pending")
    elsif current_user.is_student_org?
        @permit = Permit.where(:saoStatus => "pending" )
    end
  end
end
