class PostsController < ApplicationController
      before_action :require_logged_in, only: [:new, :create]
      before_action :is_author_or_moderator?, only: [:edit, :update, :destroy]


      def is_author_or_moderator?
            @p = Post.find(params[:id])
            redirect_to subs_url if @p.author_id != current_user.id || @p.sub.moderator_id != current_user.id
      end

      def show
            @post = Post.find(params[:id])
            render :show
      end

      def create 
            @post = Post.new(post_params)
            if @post.save
                  login!(@post)
                  redirect_to post_url(@post)
            else 
                  flash.now[:errors] = @post.errors.full_messages
                  render :new
            end
      end

      def new 
            @post = Post.new
            render :new
      end

      def edit 
            @post = Post.find(params[:id])
            render :edit
      end

      def update
            @post = Post.find(params[:id])
            @post.update!(post_params)

            # render json: User.update(params[:id], params.require(:user).permit(:name, :email))
            redirect_to post_url(@post)
      end

      def destroy
            @post = Post.find(params[:id])
            @post.destroy!
            redirect_to subs_url
      end

      private
      def post_params
            params.require(:post).permit(:title, :content, :url, :author_id, :sub_id)
      end
end
