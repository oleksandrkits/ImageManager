class UsersController < ApplicationController
  include UserChecker

  def index
    if admin?
      puts '*' * 100
      puts params.keys
      puts '*' * 100
      @users = User.all

      if params.has_key?(:sort_by)
        @users = @users.order_by(params[:sort_by])
      end

      @users = if params.has_key?(:male) and params.has_key?(:female)
         @users.where.not(sex: 'other')
      elsif params.has_key?(:female) and params.has_key?(:other)
        @users.where.not(sex: 'male')
      elsif params.has_key?(:other) and params.has_key?(:male)
        @users.where.not(sex: 'female')
      elsif params.has_key?(:other)
        @users.where(sex: 'other')
      elsif params.has_key?(:female)
        @users.where(sex: 'female')
      elsif params.has_key?(:male)
        @users.where(sex: 'male')
      end

      if (params[:age_min] != '') and (params[:age_max] != '')
        @users = @users.where("age >= #{params[:age_min]} AND age <= #{params[:age_max]}")
      elsif params[:age_min] != ''
        @users = @users.where("age >= #{params[:age_min]}")
      elsif params[:age_max] != ''
        @users = @users.where("age <= #{params[:age_max]}")
      end

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
