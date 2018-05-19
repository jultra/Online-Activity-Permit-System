class PermitsController < ApplicationController
    # protect_from_forgery prepend: true, with: :exception
    # before_action :authenticate_user!
    before_action :permit_params

    # We need to get current user ID so that it will only see its request
    def index
        @permit = Permit.where(:adviserStatus => "pending")
    end

    def approved
        @permit = Permit.where(:adviserStatus => "approved")
    end

    def rejected
        @permit = Permit.where(:adviserStatus => "rejected")
    end

    def new
        @permit = Permit.new
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
    end

    def update
        @permit = Permit.find(params[:id])
        @permit.update(activity: params[:activity], venue: params[:venue], organization: params[:organization], date_needed: params[:date_needed],
                        time: params[:time])
        flash[:notice] = "You have successfully updated the permit"
        redirect_to permits_index_path(@permit)
    end

    def destroy
        @permit = Permit.find(params[:id])
        @permit.destroy
        flash[:notice] = "You have successfully deleted the permit"
        redirect_to permits_index_path
    end

    private
        def permit_params
            params.permit(:activity, :venue, :organization, :date_needed, :time, :requisitioner, :osaStatus, :adviserStatus, :saoStatus, :facilityStatus)
        end
end
