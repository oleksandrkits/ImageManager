class UsersController < ApplicationController
  include UserChecker

  def index
    if admin?
      puts '*' * 100
      puts params.keys
      puts '*' * 100

      @users = User.all
      @users = sort_users
      @users = users_filter_by_sex
      @users = users_filter_by_age
      @users = users_filter_by_city

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

  private

  def users_filter_by_sex
    if params.has_key?(:male) and params.has_key?(:female)
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
    else
      @users
    end
  end

  def users_filter_by_age
    if params.has_key?(:age_min) or params.has_key?(:age_max)
      if (params[:age_min] != '') and (params[:age_max] != '')
        @users.where("age >= #{params[:age_min]} AND age <= #{params[:age_max]}")
      elsif params[:age_min] != ''
        @users.where("age >= #{params[:age_min]}")
      elsif params[:age_max] != ''
        @users.where("age <= #{params[:age_max]}")
      else
        @users
      end
    else
      @users
    end
  end

  def sort_users
    if params.has_key?(:sort_by)
      if params[:sort_by] == 'none' or params[:sort_by] == ''
        @users.all
      elsif params[:sort_by] == 'city'
        @users.includes(:adress).order('adresses.city')
      else
        @users.order(params[:sort_by].to_s)
      end
    else
      @users
    end
  end

  def users_filter_by_city
    @cities = @users.includes(:adress).pluck(:city).uniq.unshift('')
    if params.has_key?(:city)
      if params[:city] == ''
        @users
      else
        @users.joins(:adress).includes(:adress).where("adresses.city = ?", params[:city])
      end
    else
      @users
    end
  end

end
