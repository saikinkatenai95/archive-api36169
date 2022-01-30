class CategoriesController < ApplicationController
  before_action :set_categorie, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories, each_serializer: CategorySerializer, include: [:ideas]
  end

  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: { status: 'SUCCESS', data: @category }
    else
      render json: { status: 'ERROR', data: @category.errors }
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end


  private

  def set_categorie
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
