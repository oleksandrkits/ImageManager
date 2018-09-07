class Adress < ApplicationRecord
  has_many :users

  validates :zip, length: { is: 5,
                            message:'Enter proper zip code'
                          }, allow_blank: true
  validates :city, length: {maximum: 100}
  validates :home_number, length: {maximum: 5000}
end
