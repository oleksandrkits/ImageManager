class FavouritesController < ApplicationController
  include UserChecker
  before_action :authenticate_user!
  before_action :set_favourite, only: [:destroy]

  def index
    @favourites = ImagesUser.where(user_id: current_user.id)
  end


  def new
    @favourite = ImagesUser.new
  end

  def create
    puts '*' * 100
    puts params
    puts '*' * 100
    @favourite = ImagesUser.new({image_id: params[:image_id], user_id: current_user.id})

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url }
    end
  end

  private
    def set_favourite
      @favourite = ImagesUser.find(params[:id])
    end

    def favourite_params
      params.fetch(:favourite, {})
    end
end
