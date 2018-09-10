class UsersController < ApplicationController
  before_action :is_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    id = current_user.try(:id)
    if id == params[:id].to_i or current_user.try(:is_admin?)
      @img = Image.find(Image.ids.sample)
    else
      redirect_to access_error_path
    end
  end

  def access_error
  end

  private

  def is_admin
    unless current_user.try(:is_admin?)
      redirect_to access_error_path
    end
  end

end
