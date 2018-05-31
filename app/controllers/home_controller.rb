class HomeController < ApplicationController
    before_action :authenticate_user!
    
  def dashboard
    if current_user.is_adviser? || current_user.is_facility?
        # @permit = Permit.where(:adviserStatus => "pending")
        # @permit = Permit.where("adviserStatus= 'pending' OR facilityStatus= 'pending'")
        # @permit = Permit.where(adviser: current_user.id OR venue: Room.where(in_charge: current_user.id))
        @adviser = Permit.where(adviserStatus: 'pending', adviser: current_user.id)  ## FOR THE ADVISER
        @facility = Permit.where(facilityStatus: 'pending' ,venue: Room.where(in_charge: current_user))
        @permit = (@adviser + @facility).uniq

    elsif current_user.is_osa?
        @permit = Permit.where(:osaStatus => "pending")
    # elsif current_user.is_facility?
    #     @permit = Permit.where(:facilityStatus => "pending")
        # @permit = Permit.where(venue: Room(in_charge: current_user.id))
    elsif current_user.is_sao?
        @permit = Permit.where(:saoStatus => "pending")
    elsif current_user.is_student_org?
        @permit = Permit.where(org_id: current_user.id)
    else
        @permit = Permit.all
    end

    @users = User.all
    @rooms = Room.all
  end
end
