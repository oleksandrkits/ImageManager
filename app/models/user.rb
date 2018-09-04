class User < ApplicationRecord
  validates_presence_of :name, :email
  has_and_belongs_to_many :images
end
