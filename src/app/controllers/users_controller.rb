class UsersController < ApplicationController
    def create
    #create new user
    @user = user
    redirect_to user_path
    end

    def new
    #show new user
    end

    def update 
    #update user information
    end

    def edit 
    #show the edit form
    end

    def destroy
    #deletes user information
    end

    def show 
    #show user profile
    end
    
end
