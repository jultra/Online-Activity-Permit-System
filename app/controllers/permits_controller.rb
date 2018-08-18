class PermitsController < ApplicationController
    # protect_from_forgery prepend: true, with: :exception
    # before_action :authenticate_user!
    before_action :permit_params

    # We need to get current user ID so that it will only see its request
    def index
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

    elsif current_user.is_student_org? || current_user.is_class? || current_user.is_employee?
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

    def approved
        if current_user.is_adviser?
            @permit = Permit.where(:adviserStatus => "approved")
        elsif current_user.is_osa?
            @permit = Permit.where(:osaStatus => "approved")
        elsif current_user.is_facility?
            @permit = Permit.where(:facilityStatus => "approved")
        elsif current_user.is_sao?
            @permit = Permit.where(:saoStatus => "approved")

        elsif current_user.is_student_org? || current_user.is_class? || current_user.is_employee?

            @permit = Permit.where(saoStatus: 'approved', org_id: current_user.id)
        end

        @rooms = Room.all
    end

    def rejected
        if current_user.is_adviser?
            @permit = Permit.where(:adviserStatus => "rejected")
        elsif current_user.is_osa?
            @permit = Permit.where(:osaStatus => "rejected")
        elsif current_user.is_facility?
            @permit = Permit.where(:facilityStatus => "rejected")
        elsif current_user.is_sao?
            @permit = Permit.where(:saoStatus => "rejected")

        elsif current_user.is_student_org? || current_user.is_class? || current_user.is_employee?

            @permit = Permit.where(saoStatus: 'rejected', org_id: current_user.id)
        end

        @rooms = Room.all
    end

    def new

        @permit = Permit.new
        @rooms = Room.all
        @users = User.with_role('adviser')
    end

    def create
        @permit = Permit.new(permit_params)

        if @permit.save
            flash[:notice] = "You have successfully created a permit"
            redirect_to permits_index_path
        else
            render 'new'
        end
    end

    def edit
        @permit = Permit.find(params[:id])
        @users = User.all
        @rooms = Room.all
    end

    def update
        @permit = Permit.find(params[:id])
        @permit.update(activity: params[:activity], venue: params[:venue], org_id: params[:org_id], date_needed: params[:date_needed],
                        timefrom: params[:timefrom], timeto: params[:timeto], equipments: params[:equipments], osaStatus: params[:osaStatus], adviserStatus: params[:adviserStatus],
                        adviser: params[:adviser], facilityStatus: params[:facilityStatus], saoStatus: params[:saoStatus])
        flash[:notice] = "You have successfully updated the permit"
        redirect_to permits_index_path(@permit)
    end

    def destroy
        @permit = Permit.find(params[:id])
        @permit.destroy
        flash[:notice] = "You have successfully deleted the permit"
        redirect_to permits_index_path
    end

    def pdf
      
        @permit = Permit.find(params[:id])
        @room = Room.find(@permit.venue)
        @user = User.find(@room.in_charge)
        @requisitioner = User.find(@permit.org_id)

        # @permit=@permit.joins(:user)
        # #@permit = Permit.find(params[:id])
        respond_to do |format|
        format.html
        format.pdf do
            render :pdf => "report", :template => 'permits/pdf.html.erb'
        end
        format.html
        end
    end

    def show
        @permit = Permit.where(:saoStatus => "approved")
        @rooms = Room.all
    end

    private
        def permit_params
            params.permit(:activity, :venue, :org_id, :date_needed, :date_end, :equipments, :timefrom, :timeto, :adviser, :osaStatus, :adviserStatus, :saoStatus, :facilityStatus)
        end
end