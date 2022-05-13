class UsersController < ApplicationController
      before_action :require_logged_in, only: [:edit, :update]

      def index 
            if params[:query]
                  @users = User.where('username LIKE (?)', '%' + params[:query] + '%')
                  render :index
            else 
                  @users = User.all
                  render :index
            end
      end

      def show
            @user = User.find(params[:id])
            render :show
      end

      def create 
            @user = User.new(user_params)
            if @user.save
                  login!(@user)
                  redirect_to user_url(@user)
            else 
                  flash.now[:errors] = @user.errors.full_messages
                  render :new
            end
      end

      def new 
            @user = User.new
            render :new
      end

      def edit 
            @user = User.find(params[:id])
            render :edit
      end

      def update
            @user = User.find(params[:id])
            @user.update!(user_params)

            # render json: User.update(params[:id], params.require(:user).permit(:name, :email))
            redirect_to user_url(@user)
      end
      private
      def user_params
            params.require(:user).permit(:username, :password, :picture_url, :birthdate)
      end
end
