class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:edit, :update, :show, :destory, :new, :create]
  
  def index
      if params[:search] == nil
        @posts = Post.all.page(params[:page]).per(10)
    elsif params[:search] == ''
        @posts = Post.all.page(params[:page]).per(10)
    else
        @posts = Post.where("question LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(10)
    end
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
          redirect_to action: "index"  
        else
          redirect_to action: "new"      
        end
        
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        redirect_to action: "show", :id => post.id
      else  
        redirect_to action: "new"
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: "index"
    end
    
  
    private
    def post_params
        params.permit(:title, :genre, :question, :image)
    end
end
