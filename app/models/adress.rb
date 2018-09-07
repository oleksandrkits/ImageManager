class Adress < ApplicationRecord
  has_many :users

  validates :zip, length: { is: 5,
                            message:'Enter proper zip code'
                          }, allow_blank: true
  validates :city, length: {maximum: 100}
  validates :home_number, numericality: {greater_than:0, less_than_or_equal_to: 5000}
end