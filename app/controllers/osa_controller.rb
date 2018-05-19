class OsaController < ApplicationController
    def approve
        @permit = Permit.find(params[:id])
        @permit.update(osaStatus: "approved")
        flash[:notice] = "You have successfully approved the permit"
        redirect_to permits_index_path(@permit)
    end

    def reject
        @permit = Permit.find(params[:id])
        @permit.update(adviserStatus: "rejected")
        flash[:notice] = "You have successfully rejected the permit"
        redirect_to permits_index_path(@permit)
    end
end