class PermitsController < ApplicationController
    # protect_from_forgery prepend: true, with: :exception
    # before_action :authenticate_user!
    before_action :permit_params

    # We need to get current user ID so that it will only see its request
    def index
        @permit = Permit.where(:osaStatus => "pending")
    end

    def approved
        @permit = Permit.where(:adminStatus => "approved")
    end

    def rejected
        @permit = Permit.where(:adminStatus => "rejected")
    end

    def new
        @permit = Permit.new
    end

    def create
        @permit = Permit.new(permit_params)

        if @permit.save
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
        @permit.update(activity: params[:activity])
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
            params.permit(:activity, :venue, :organization, :date_needed, :time, :requisitioner, :osaStatus, :adminStatus, :telesStatus)
        end
end
