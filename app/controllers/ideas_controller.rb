class IdeasController < ApplicationController
  before_action :set_category
  before_action :set_category_idea, only: [:show, :update, :destroy]

  def index
    json_response(@category.ideas)
  end

  def show
    json_response(@idea)
  end

  def create
    @category.ideas.create!(idea_params)
    json_response(@category, :created)
  end

  def update
    @idea.update(idea_params)
    head :no_content
  end

  def destroy
    @idea.destroy
    head :no_content
  end

  

  private
  def idea_params
    params.permit(:body)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_category_idea
    @idea = @category.ideas.find_by!(id: params[:id]) if @category
  end
end
