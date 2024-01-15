require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should render the index page with every existing user' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(response.body).to include('all users of the app will arrive')
    end

    it 'should render the show page with specifics of one user' do
      get '/users/1'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end
end
