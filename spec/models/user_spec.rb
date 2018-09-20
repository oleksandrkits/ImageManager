require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:first_name){'Ivan'}
  let(:last_name){'Petrov'}
  let(:user) do
    User.new(first_name: first_name,
             last_name: last_name,
             email: 'example@example.com',
             password: '123456'
    )
  end
  describe "#name" do
    context 'when both present' do
      let(:first_name){'Oleg'}
      let(:last_name){'Lazaryev'}

      it 'merge users first name and last name' do
        expect(user.name).to eq('Oleg Lazaryev')
      end
    end
    context 'when first name blank' do
      let(:first_name){''}
      let(:last_name){'Lazaryev'}

      it 'show only last name' do
        expect(user.name).to eq('Lazaryev')
      end
    end
    context 'when last name blank' do
      let(:first_name){'Oleg'}
      let(:last_name){''}

      it 'show only last name' do
        expect(user.name).to eq('Oleg')
      end
    end
    context 'when both blank' do
      let(:first_name){''}
      let(:last_name){''}

      it 'show only last name' do
        expect(user.name).to eq('')
      end
    end
    context 'when first name is whitespace' do
      let(:first_name){' '}
      let(:last_name){'Lazaryev'}

      it 'show only last name' do
        expect(user.name).to eq('Lazaryev')
      end
    end
  end

  describe 'validation' do

    context 'for first name when' do
      it 'is blank is not valid' do
        expect(build(:user, first_name: '')).not_to be_valid
      end
      it 'length is too short is not valid' do
        expect(build(:user, first_name: '1')).not_to be_valid
      end
      it 'length is too long is not valid' do
        first_name = '1'*101
        expect(build(:user, first_name: first_name)).not_to be_valid
      end
      it 'length is 10 symbols is valid' do
        expect(build(:user, first_name: '1234567890')).to be_valid
      end
    end

    context 'for last name when' do
      it 'is blank is not valid' do
        expect(build(:user, last_name: '')).not_to be_valid
      end
      it 'length is too short is not valid' do
        expect(build(:user, last_name: '1')).not_to be_valid
      end
      it 'length is too long is not valid' do
        last_name = '1'*101
        expect(build(:user, last_name: last_name)).not_to be_valid
      end
      it 'length is 10 symbols is valid' do
        expect(build(:user, last_name: '1234567890')).to be_valid
      end
    end

    context 'for about when' do
      it 'is blank is valid' do
        expect(build(:user, about: nil)).to be_valid
      end
      it 'length is too long is not valid' do
        about = '1'*301
        expect(build(:user, about: about)).not_to be_valid
      end
    end

    context 'for age when' do
      it 'is blank is valid' do
        expect(build(:user, age: nil)).to be_valid
      end
      it 'is too big is not valid' do
        expect(build(:user, age: 121)).not_to be_valid
      end
    end

    context 'for sex when' do
      it 'is blank is not valid' do
        expect(build(:user, sex: nil)).not_to be_valid
      end
    end

    context 'for email when' do
      it 'is blank is not valid' do
        expect(build(:user, email: nil)).not_to be_valid
      end
    end

    context 'for address when' do
      it 'is blank is not valid' do
        expect(build(:user, adress: nil)).not_to be_valid
      end
    end
  end
end
