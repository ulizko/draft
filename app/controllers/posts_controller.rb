class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    build_post
  end

  def create
    build_post
    save_post or render :new
  end

  def edit
    load_post
  end

  def update
    load_post
    save_post or render :edit
  end

  def show
    load_post
  end

  def destroy
    load_post
  end

  private

  def post_params
    post_params = params.fetch(:post, {})
    post_params.permit!
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def build_post
    @post = Post.new
    @post.attributes = post_params
  end

  def save_post
    if @post.save
      redirect_to posts_path
    end
  end
end
