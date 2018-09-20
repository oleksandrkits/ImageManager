class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  AVAILABLE_SEX = ['male', 'female', 'other']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :adress, dependent: :destroy
  has_and_belongs_to_many :images
  accepts_nested_attributes_for :adress, update_only: true

  enum sex: { male: 0, female: 1, other: 2 }

  validates_presence_of :first_name, :email, :last_name, :sex, :adress
  validates :age, allow_blank: true, numericality: { greater_than: 0,
                                                     less_than_or_equal_to: 120,
                                                     message: 'age must be in 1 .. 120 range'
                                                   }
  validates :first_name, :last_name, length: { in: 2..100}
  validates :about, length: { maximum: 300 }

  validates_associated :adress

  def name
    [first_name.strip.presence, last_name.strip.presence].compact.join(' ')
  end

end
