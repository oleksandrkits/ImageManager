class User < ApplicationRecord
  enum sex: {male: 0, female: 1, other: 2}

  validates_presence_of :first_name, :email
  validates :age, numericality: {greater_than: 0,
                                 less_than_or_equal_to: 120,
                                 message: 'age must be in 1 .. 120 range'
                                }
  validates :first_name, :last_name, length: {in: 2..100 }, allow_blank: true
  validates :about, length: {maximum: 300}

  has_one :adress
  has_and_belongs_to_many :images
  accepts_nested_attributes_for :adress,
                                allow_destroy: true

end
