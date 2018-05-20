class AdviserController < ApplicationController
    def approve
        @permit = Permit.find(params[:id])

        if current_user.is_adviser?
            @permit.update(adviserStatus: "approved")
        elsif current_user.is_osa?
            @permit.update(osaStatus: "approved")
        elsif current_user.is_facility?
            @permit.update(facilityStatus: "approved")
        elsif current_user.is_sao?
            @permit.update(saoStatus: "approved")
        end
        
        flash[:notice] = "You have successfully approved the permit"
        redirect_to permits_index_path(@permit)
    end

    def reject
        @permit = Permit.find(params[:id])

        if current_user.is_adviser?
            @permit.update(adviserStatus: "rejected")
            @permit.update(osaStatus: "rejected")
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif current_user.is_osa?
            @permit.update(osaStatus: "rejected")
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif current_user.is_facility?
            @permit.update(facilityStatus: "rejected")
            @permit.update(saoStatus: "rejected")
        elsif current_user.is_sao?
            @permit.update(saoStatus: "rejected")
        end
        
        flash[:notice] = "You have successfully rejected the permit"
        redirect_to permits_index_path(@permit)
    end
end