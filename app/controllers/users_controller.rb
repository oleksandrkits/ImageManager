class UsersController < ApplicationController
  include UserChecker

  def index
    if admin?
      @users = User.order_by(params[:sort_by])
    else
      redirect_to access_error_path
    end

  end

  def show
    if admin? or is_current_user(params[:id])
      @img = Image.find(Image.ids.sample)
    else
      redirect_to access_error_path
    end
  end

  def access_error
  end
end
