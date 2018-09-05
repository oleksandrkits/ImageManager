class User < ApplicationRecord
  enum sex: {male: 0, female: 1, other: 2}
  validates_presence_of :first_name, :email
  has_one :adress
  has_and_belongs_to_many :images
end
