require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do

    before(:each) do
      @user = User.new(name: 'Mesi', posts_counter: 5)
      @user.save
      get '/users/1/posts'
    end
    it 'checks the correct response status, template and placeholder text' do
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(response.body).to include('for all posts')
    end
  end
end
