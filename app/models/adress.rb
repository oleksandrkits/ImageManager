class Adress < ApplicationRecord
  belongs_to :user, optional: true

  validates :zip, allow_blank: true, numericality: { greater_than_or_equal_to: 10000,
                                                     less_than_or_equal_to: 99999,
                                                     message: 'Enter proper zip code'
                                                   }

  validates :city, :street, length: { maximum: 100 }
  validates :home_number, allow_blank: true, numericality: { greater_than:0,
                                                             less_than_or_equal_to: 5000
                                                           }
end
