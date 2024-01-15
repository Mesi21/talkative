require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should render the index page with every existing user' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end
end
