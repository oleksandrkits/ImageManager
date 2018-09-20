require "rails_helper"

RSpec.describe 'Images', :type => :request do

  describe '#index' do
    before do
      get root_path
    end
    it 'displays all images' do

    end
    it 'succeeds' do
      expect(response).to be_ok
    end
    it 'renders index' do
      expect(response).to render_template('images/index')
    end
  end
end