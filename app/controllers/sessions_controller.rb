class SessionsController < ApplicationController


    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user.nil?
            flash.now[:errors] = @user.errors.full_messages
            render :new
        else
            login!(@user)
            redirect_to user_url(@user)
        end
    end
    
    def destroy
        logout!
        redirect_to users_url
    end
end
