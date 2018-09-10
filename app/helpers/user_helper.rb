module UserHelper

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

  def get_female_count
    User.where(sex: 'female').count
  end

  def get_male_count
    User.where(sex: 'male').count
  end

  def get_other_count
    User.where(sex: 'other').count
  end

end