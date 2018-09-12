class UsersController < ApplicationController
  include UserChecker

  def index
    if admin?
      @users = User.order_by(params[:sort_by])
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end

  end

  def show
    if admin? or is_current_user(params[:id])
      @img = Image.find(Image.ids.sample)
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  def access_error
  end
end
