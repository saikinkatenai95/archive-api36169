class CategoriesController < ApplicationController
  before_action :set_categorie, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    json_response(@categories)
  end

  def show
    json_response(@category)
  end

  def create
    @category = Category.create!(categorie_params)
    json_response(@category, :created)
  end

  def update
    @category.update(categorie_params)
    head :no_content
  end

  def destroy
    @category.destroy
    head :no_content
  end


  private

  def set_categorie
    @category = Category.find(params[:id])
  end

  def categorie_params
    params.permit(:name)
  end
end
