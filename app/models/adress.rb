class Adress < ApplicationRecord
  belongs_to :user

  validates :zip, allow_blank: true, length: { is: 5,
                                               message:'Enter proper zip code'
                                             }

  validates :city, length: { maximum: 100 }
  validates :home_number, numericality: { greater_than:0,
                                          less_than_or_equal_to: 5000
                                        }
end
