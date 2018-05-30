class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:posts, :comments).order(updated_at: :desc)
    # render json: @categories
  end

  def new
    build_category
  end

  def create
    build_category
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: [:api, @category] }
      else
        format.html { render :new }
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = category_params
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:api, @category] }
      else
        format.html { render :edit }
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    # render json: @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def category_params
    category_params = params.fetch(:category, {})
    category_params.permit!
  end

  def build_category
    @category = Category.new
    @category.attributes = category_params
  end

end