class UsersController < ApplicationController

  def index
    if is_admin
      @users = User.order_by(params[:sort_by])
    else
      redirect_to access_error_path
    end

  end

  def show
    if is_admin or is_current_user(params[:id])
      @img = Image.find(Image.ids.sample)
    else
      redirect_to access_error_path
    end
  end

  def access_error
  end
end
