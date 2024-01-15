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

  describe 'GET /show' do
    before(:each) do
      @user = User.new(name: 'Mesi', posts_counter: 5)
      @post = Post.new(title: 'Test post', text: 'To test the posts_controller', comments_counter: 2, likes_counter: 5,
                       author_id: 1)
      @user.save
      @post.save
    end

    it 'shows the specific of one post' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
      expect(response.body).to include('one particular post')
    end
  end
end
