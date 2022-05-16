class Owner::MenusController < ApplicationController

    def index
        @menus = Menu.all.order(:created_at)
    end

    def new 
        @menu = Menu.new
    end

    def create
        @menu = Menu.new(menu_params)
        if @menu.save
            flash[:notice] = "Menu Added"
            redirect_to owner_menus_path
        else
            flash[:notice] = "Menu can't be blank"
            render 'owner/menus/new'
        end
    end

    def edit
        @menu = Menu.find(params[:id])
    end

    def update
        @menu = Menu.find(params[:id])
        if @menu.update(menu_params)
            flash[:notice] = "Menu updated"
            redirect_to owner_menus_path
        else
            flash[:error] = "Update failed"
            redirect_to edit_menu_owner_path
        end  
    end

    def destroy
        Menu.destroy(params[:id])
        flash[:notice] = "Menu removed!"
        redirect_to owner_menus_path
    end

    private
        def menu_params
            params.require(:menu).permit(:name,:price)
        end

end