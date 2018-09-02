class Image < ApplicationRecord
  has_and_belongs_to_many :users

  def self.favourite_for_user(user_id)
    where(favourites.user_id == user_id)
  end
end
