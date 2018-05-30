class Api::PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).order(created_at: :desc).last(10)
  end

  def new
    build_post
  end

  def create
    build_post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [:api, @post] }
      else
        format.html { render :new }
        format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
      end
    end
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
end
