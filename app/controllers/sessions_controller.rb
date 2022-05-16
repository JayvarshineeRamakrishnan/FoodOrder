class SessionsController < ApplicationController
    def new
        @signUpFlag = false
        render "sessions/new"
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:current_user_id] = user.id 
            flash[:notice] = "Logged in Sucessfully"
            redirect_to menus_path
        else
            flash[:alert] = "Invalid email or Password"
            redirect_to root_path
        end
    end

    def destroy
        session[:current_order_id] = nil
        resetUser
        flash[:notice] = "Signed Out successfully"
        redirect_to root_path
    end
end