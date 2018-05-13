class PermitsController < ApplicationController
    # protect_from_forgery prepend: true, with: :exception
    # before_action :authenticate_user!

    def index
        @permit = Permit.all.order("created_at DESC")
        return @permit
    end

    def new
        @permit = Permit.new
    end

    def create
        @permit = Permit.new(permit_params)

        if @permit.save
            redirect_to apply_pending_path
        else
            render 'new'
        end
    end

    private
        def permit_params
            params.permit(:activity, :venue, :organization, :date_needed, :time, :requisitioner, :status)
        end
end
