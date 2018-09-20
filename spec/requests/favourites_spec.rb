require 'rails_helper'

RSpec.describe 'Favourites', :type => :request do
  let(:password){'123456'}
  let!(:user){create(:user, password: password, id: 1)}
  let!(:image){create(:image, id: 1)}

  describe '#index' do
    before do
      post '/login', params: {user: {
          email: user.email,
          password: password
      }
      }
      get favourites_path
    end
    it 'succeeds' do
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    context 'when user logged in' do
      before do
        post '/login', params: {user: {
            email: user.email,
            password: password
        }
        }
        get favourites_path
      end
      it 'tries post new favourite' do
      expect{post '/favourites', params: {image_id: 1, user_id: 1}}.to change{ImagesUser.where(user_id: 1).count}.by(1)
      end
    end
  end
end