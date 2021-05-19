class TreesController < ApplicationController

  def index
    @tree = Tree.all
    render json: @tree, include: :birds
  end

  def show
    find_tree
    render json: @tree, include: :birds
  end

  def create
    @tree = Tree.find params[:id]
    @new_tree = Tree.create name: params[:name]
    render json: @new_tree
  end

  def update
    find_tree
    @tree.update name: params[:name]
    render json: @tree
  end

  def destroy
    find_tree
    @tree.destroy
  end

  private

  def find_tree
    @tree = Tree.find params[:id]
  end

end
