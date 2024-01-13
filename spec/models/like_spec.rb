require './spec/rails_helper'

RSpec.describe Post, type: :model do
  let(:current_user) {User.new(name: 'Mesi', photo: 'https://unsplash.com/photos/man-in-front-of-laptop-computer-in-shallow-focus-photography-LNRyGwIJr5c', bio: 'Web developer from Romania.', posts_counter: 1)}
  let(:current_post) {Post.new(title: 'Module restart and frustrations', text: 'test', author: current_user, comments_counter: 8, likes_counter: 12)}
  subject {Like.new(user: current_user, post: current_post)}

  it 'should be valid with proper user and post' do
    expect(subject).to be_valid
  end

  it 'should be valid if post is missing' do
    subject.post = nil
    expect(subject).not_to be_valid
  end
end