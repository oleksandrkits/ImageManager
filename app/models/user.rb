class User < ApplicationRecord
  validates_presence_of :first_name, :email
  has_one :adress
  has_and_belongs_to_many :images
end
