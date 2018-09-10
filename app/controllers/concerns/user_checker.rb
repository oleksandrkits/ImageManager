module UserChecker
  extend ActiveSupport::Concern

  def is_admin
    current_user.try(:is_admin?)
  end

  def is_current_user(id)
    id.to_i == current_user.try(:id)
  end

end