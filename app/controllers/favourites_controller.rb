class FavouritesController < ApplicationController
  include UserChecker

  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  def index
    if admin? or is_current_user(params[:user_id])
      @favourites = User.find(params[:user_id]).images
    else
      redirect_to access_error_path
    end
  end


  def new
    if admin? or is_current_user(params[:user_id])
      @favourite = ImagesUser.new
      @favourite_id = params[:id]
    else
      redirect_to access_error_path
    end
  end

  def create
    @favourite = ImagesUser.new({image_id: params[:images_user][:id], user_id: params[:user_id]})

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to user_favourites_path }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to user_favourites_url }
      format.json { head :no_content }
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
