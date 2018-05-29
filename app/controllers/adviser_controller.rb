class AdviserController < ApplicationController
    def approve
        @permit = Permit.find(params[:id])
        @user = current_user
        if current_user.is_adviser? || current_user.is_facility?
            if @user.authenticate(params[:password])
                if @permit.adviserStatus == "pending"
                    @permit.update(adviserStatus: "approved")
                elsif @permit.facilityStatus == "pending"
                    @permit.update(facilityStatus: "approved")
                end
            end
        elsif current_user.is_osa?
            @permit.update(osaStatus: "approved")
        # elsif current_user.is_facility?
        #     @permit.update(facilityStatus: "approved")
        elsif current_user.is_sao?
            @permit.update(saoStatus: "approved")
        end
        
        flash[:notice] = "You have successfully approved the permit"
        redirect_to permits_index_path(@permit)
    end

    def reject
        @permit = Permit.find(params[:id])

        if @permit.adviserStatus == "pending"
            @permit.update(adviserStatus: "rejected")
            @permit.update(osaStatus: "rejected")
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif @permit.osaStatus == "pending"
            @permit.update(osaStatus: "rejected")
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif @permit.facilityStatus == "pending"
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif @permit.saoStatus == "pending"
            @permit.update(saoStatus: "rejected")
        end
        # if current_user.is_adviser?
        #     @permit.update(adviserStatus: "rejected")
        #     @permit.update(osaStatus: "rejected")
        #     @permit.update(facilityStatus: "rejected")
        #     @permit.update(saoStatus: "rejected")
        # elsif current_user.is_osa?
        #     @permit.update(osaStatus: "rejected")
        #     @permit.update(facilityStatus: "rejected")
        #     @permit.update(saoStatus: "rejected")
        # elsif current_user.is_facility?
        #     @permit.update(facilityStatus: "rejected")
        #     @permit.update(saoStatus: "rejected")
        # elsif current_user.is_sao?
        #     @permit.update(saoStatus: "rejected")
        # end
        
        flash[:notice] = "You have successfully rejected the permit"
        redirect_to permits_index_path(@permit)
    end
end