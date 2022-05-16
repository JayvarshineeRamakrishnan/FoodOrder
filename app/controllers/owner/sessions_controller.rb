class Owner::SessionsController < ApplicationController
    def new
        render 'owner/sessions/new'
    end


    def create
        owner = Owner.find_by(email: params[:email])
        if owner.present? && owner.authenticate(params[:password])
            redirect_to owners_path , notice: "Logged in Successfully"
        else
            redirect_to owner_sign_in_path, alert: "Incorrect Email or Password "
        end
    end

    def destroy
        flash[:notice] = "Signed Out successfully"
        redirect_to owner_sign_in_path
    end
end