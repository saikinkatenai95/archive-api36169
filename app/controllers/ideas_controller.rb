class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  def index
    @ideas = Idea.all
    render json: @ideas, each_serializer: IdeaSerializer, include: [:category]
  end

  def show
    render json: @idea
  end

  def create
    @category = Category.new(category_params)
    binding.pry
    @idea = Idea.new(idea_params)
    if Category.exists?(name: params[:category][:name])
      # render json: @ideas
      idea_body.save
    else
      @category.save
      @idea.save
    end
  end

  def update
    @idea.update(idea_params)
    render json: @idea
  end

  def destroy
    @idea.destroy
    render json: @idea
  end

  

  private
  def idea_params
    params.require(:idea).permit(:body)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def category_params
    params.permit(:category_id,:name)
  end

end
