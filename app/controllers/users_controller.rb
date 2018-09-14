class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if admin?

      @sex_filter = params[:filters].try(:[], :sex) || []
      @min_age_filter = params[:filters].try(:[], :age_min) || []
      @max_age_filter = params[:filters].try(:[], :age_max) || []
      @sort_by = params[:filters].try(:[], :sort_by) || []
      @city_filter = params[:filters].try(:[], :city) || []

      @users = User.all
      @users = sort_users
      @users = users_filter_by_sex
      @users = users_filter_by_age
      @users = users_filter_by_city

      @user_count = get_users_count
      @user_female_count = get_sex_count('female')
      @user_male_count = get_sex_count('male')
      @user_other_count = get_sex_count('other')
      @users_average_age = get_users_average_age
      @youngest_user = get_youngest_user
      @oldest_user = get_oldest_user

    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end

  end

  def show
    if admin?
      @user = User.find(params[:id])
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  private

  def users_filter_by_sex
    return @users if @sex_filter.blank?
    @users.where(sex: @sex_filter)
  end

  def users_filter_by_age
    if @max_age_filter.present? and @min_age_filter.present?
      @users.where("age >= #{@min_age_filter} AND age <= #{@max_age_filter}")
    elsif @min_age_filter.present?
      @users.where("age >= #{@min_age_filter}")
    elsif @max_age_filter.present?
      @users.where("age <= #{@max_age_filter}")
    else
      @users
    end
  end

  def sort_users
     return @users if (@sort_by.blank? or @sort_by == 'none')
      if @sort_by == 'city'
        @users.includes(:adress).order('adresses.city')
      else
        @users.order(@sort_by.to_s)
      end
  end

  def users_filter_by_city
    @cities = @users.includes(:adress).pluck(:city).uniq.unshift('')
    return @users if (@city_filter.blank?)
    @users.joins(:adress).where("adresses.city = ?", @city_filter)
  end

  def get_users_count
    User.count
  end

  def get_users_average_age
    User.average(:age)
  end

  def get_youngest_user
    User.minimum(:age)
  end

  def get_oldest_user
    User.maximum(:age)
  end

  def get_sex_count(sex)
    User.where(sex: sex).count
  end

  def admin?
    current_user.try(:is_admin?)
  end
end
