require 'rails_helper'

RSpec.describe Adress, :type => :model do
  describe 'Validations' do
    context 'when city' do
      it 'is blank it is valid' do
        expect(build(:adress, city: nil)).to be_valid
      end
      it 'length is longer than 100 is not valid' do
        city = '1' * 101
        expect(build(:adress, city: city)).not_to be_valid
      end
    end

    context 'when street' do
      it 'is blank it is valid' do
        expect(build(:adress, street: nil)).to be_valid
      end
      it 'length is longer than 100 is not valid' do
        street = '1' * 101
        expect(build(:adress, street: street)).not_to be_valid
      end
    end

    context 'when home number' do
      it 'is blank it is valid' do
        expect(build(:adress, home_number: nil)).to be_valid
      end
      it 'length is in 5000 range is valid' do
        expect(build(:adress, home_number: 1255)).to be_valid
      end
      it 'house number is 0 is not valid' do
        expect(build(:adress, home_number: 0)).not_to be_valid
      end
      it 'length is longer than 5 chars is not valid' do
        expect(build(:adress, home_number: 123455)).not_to be_valid
      end
      it 'includes not only digits with length of 5 is not valid' do
        expect(build(:adress, home_number: '12cde')).not_to be_valid
      end
      it 'includes not only digits with length more than 5 is not valid' do
        expect(build(:adress, home_number: '12123cde')).not_to be_valid
      end
    end

    context 'when zip' do
      it 'is blank it is valid' do
        expect(build(:adress, zip: nil)).to be_valid
      end
      it 'length is longer than 5 chars is not valid' do
        expect(build(:adress, zip: 123455)).not_to be_valid
      end
      it 'includes not only digits with length of 5 is not valid' do
        expect(build(:adress, zip: '12cde')).not_to be_valid
      end
      it 'includes not only digits with length more than 5 is not valid' do
        expect(build(:adress, zip: '12123cde')).not_to be_valid
      end
    end
  end
end
