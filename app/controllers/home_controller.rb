class HomeController < ApplicationController
    before_action :authenticate_user!
    
  def dashboard
    if current_user.is_adviser? || current_user.is_facility?
        # @permit = Permit.where(:adviserStatus => "pending")
        # @permit = Permit.where("adviserStatus= 'pending' OR facilityStatus= 'pending'")
        # @permit = Permit.where(adviser: current_user.id OR venue: Room.where(in_charge: current_user.id))

        ## PENDING 
        @adviser = Permit.where(adviserStatus: 'pending', adviser: current_user.id)  ## FOR THE ADVISER
        @facility = Permit.where(facilityStatus: 'pending' ,venue: Room.where(in_charge: current_user))
        @permit = (@adviser + @facility).uniq
        @pending = @permit.count

        ## APPROVED
        @adviserA = Permit.where(adviserStatus: 'approved', adviser: current_user.id)  ## FOR THE ADVISER
        @facilityA = Permit.where(facilityStatus: 'approved' ,venue: Room.where(in_charge: current_user))
        @permitA = (@adviserA + @facilityA).uniq
        @approved = @permitA.count

        ## REJECTED
        @adviserR = Permit.where(adviserStatus: 'rejected', adviser: current_user.id)  ## FOR THE ADVISER
        @facilityR = Permit.where(facilityStatus: 'rejected' ,venue: Room.where(in_charge: current_user))
        @permitR = (@adviserR + @facilityR).uniq
        @rejected = @permitR.count


    elsif current_user.is_osa?
        @permit = Permit.where(:osaStatus => "pending")
        @pending = @permit.count
    
        @permitA = Permit.where(:osaStatus => "approved")
        @approved = @permitA.count

        @permitR = Permit.where(:osaStatus => "rejected")
        @rejected = @permitR.count
    # elsif current_user.is_facility?
    #     @permit = Permit.where(:facilityStatus => "pending")
        # @permit = Permit.where(venue: Room(in_charge: current_user.id))
    elsif current_user.is_sao?
        @permit = Permit.where(:saoStatus => "pending")
        @pending = @permit.count
    
        @permitA = Permit.where(:saoStatus => "approved")
        @approved = @permitA.count

        @permitR = Permit.where(:saoStatus => "rejected")
        @rejected = @permitR.count

    elsif current_user.is_student_org?
        @permit = Permit.where(org_id: current_user.id, saoStatus: 'pending')
        @pending = @permit.count
    
        @permitA = Permit.where(org_id: current_user.id, saoStatus: 'approved')
        @approved = @permitA.count

        @permitR = Permit.where(org_id: current_user.id, saoStatus: 'rejected')
        @rejected = @permitR.count

    else
        @permit = Permit.all
    end

    @users = User.all
    @rooms = Room.all
  end
end
