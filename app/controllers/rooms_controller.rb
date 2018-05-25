class RoomsController < ApplicationController
    def new
        @room = Room.new
        @users = User.all   ##### query only the facilities
    end

    def create
        @room = Room.new(room_params)

        if @room.save
            flash[:notice] = "You have successfully added a room"
            redirect_to rooms_show_path
        else
            render 'new'
        end
    end

    def show
        @room = Room.all
        @users = User.all
    end

    def edit
        @room = Room.find(params[:id])
        # @users = User.where(@room.in_charge == :id)
        @users = User.all
    end

    def update
        @room = Room.find(params[:id])
        @permit.update(room: params[:room], in_charge: params[:in_charge])
        flash[:notice] = "You have successfully updated the room"
        redirect_to rooms_show_path(@room)
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        flash[:notice] = "You have successfully deleted the permit"
        redirect_to rooms_show_path
    end

    private
        def room_params
            params.permit(:room, :in_charge)
        end
end