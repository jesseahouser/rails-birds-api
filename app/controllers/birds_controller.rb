class BirdsController < ApplicationController

  def index
    @birds = Bird.all
    render json: @birds, include: :tree
  end

  def show
    find_bird
    render json: @bird, include: :tree
  end

  def create
    @tree = Tree.find params[:tree_id]
    @new_bird = Bird.create name: params[:name], tree: @tree
    render json: @new_bird
  end

  def update
    find_bird
    @bird.update name: params[:name]
    render json: @bird
  end

  def destroy
    find_bird
    @bird.destroy
  end

  private

  def find_bird
    @bird = Bird.find params[:id]
  end

end
