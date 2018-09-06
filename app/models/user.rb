class User < ApplicationRecord
  enum sex: {male: 0, female: 1, other: 2}
  validates_presence_of :first_name, :email

  has_one :adress
  has_and_belongs_to_many :images

  accepts_nested_attributes_for :adress,
                                allow_destroy: true,
                                reject_if: :zip_code_invalid

  private

  def zip_code_invalid(attributes)
    # office name shouldn't start with underscore
    attributes['zip'].size != 5
  end
end
