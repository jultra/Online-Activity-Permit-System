class AdviserController < ApplicationController
    def approve
        @permit = Permit.find(params[:id])
        @user = User.find_by_email(current_user.email)
        if @user.valid_password?(params[:password])
            if current_user.is_adviser? || current_user.is_facility?
                if @permit.adviserStatus == "pending"
                    @permit.update(adviserStatus: "approved")
                elsif @permit.facilityStatus == "pending"
                    @permit.update(facilityStatus: "approved")
                end
            elsif current_user.is_osa?
                @permit.update(osaStatus: "approved")
            # elsif current_user.is_facility?
            #     @permit.update(facilityStatus: "approved")
            elsif current_user.is_sao?
                @permit.update(saoStatus: "approved")
                create_hash
            end
            flash[:notice] = "You have successfully approved the permit"
        else
            flash[:notice] = "Incorrect Password"
        end
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
    
    def create_hash
        @permit = Permit.find(params[:id])
        
        o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        rand_string = (0...50).map { o[rand(o.length)] }.join
        @permit.key = (@permit.venue).to_s + rand_string
       
        key = @permit.key + rand_string

        @permit.update(key: key)
    end
end