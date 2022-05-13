class SubsController < ApplicationController
      before_action :require_logged_in, only: [:new, :create]
      before_action :is_moderator?, only: [:edit, :update]

      def is_moderator?
            if !current_user.moderated_subs.where('id = (?)', params[:id]).exists?
                  redirect_to subs_url
            end
      end

      def index 
            if params[:query]
                  @subs = Sub.where('title LIKE (?)', '%' + params[:query] + '%')
                  render :index
            else 
                  @subs = Sub.all
                  render :index
            end
      end

      def show
            @sub = Sub.find(params[:id])
            render :show
      end

      def create 
            @sub = Sub.new(sub_params)
            if @sub.save
                  redirect_to sub_url(@sub)
            else 
                  flash.now[:errors] = @sub.errors.full_messages
                  render :new
            end
      end

      def new 
            @sub = Sub.new
            render :new
      end

      def edit 
            @sub = Sub.find(params[:id])
            render :edit
      end

      def update
            @sub = Sub.find(params[:id])
            @sub.update!(sub_params)

            # render json: User.update(params[:id], params.require(:user).permit(:name, :email))
            redirect_to sub_url(@sub)
      end

      private 
      def sub_params 
            params.require(:sub).permit(:title, :moderator_id, :description)
      end
end
