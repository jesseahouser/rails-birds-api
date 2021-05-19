class BirdsController < ApplicationController

  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    find_bird
    render json: @bird
  end

  def create
    @new_bird = Bird.create name: params[:name]
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
