require './spec/rails_helper'

RSpec.describe Comment, type: :model do
  let(:current_user) { User.new(name: 'Mesi', photo: 'https://unsplash.com/photos/man-in-front-of-laptop-computer-in-shallow-focus-photography-LNRyGwIJr5c', bio: 'Web developer from Romania.', posts_counter: 1) }
  let(:current_post) do
    Post.new(title: 'Module restart and frustrations', text: 'test', author: current_user, comments_counter: 8,
             likes_counter: 12)
  end
  subject { Comment.new(text: 'test a comment', user: current_user, post: current_post) }

  it 'should validate user with all elements filled' do
    expect(subject).to be_valid
  end

  it 'should not be valid without a text' do
    subject.text = nil
    expect(subject).not_to be_valid
  end
end
