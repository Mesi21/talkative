require './spec/rails_helper'

RSpec.describe Post, type: :model do
  let(:current_user) { User.create!(name: 'Mesi', photo: 'https://unsplash.com/photos/man-in-front-of-laptop-computer-in-shallow-focus-photography-LNRyGwIJr5c', bio: 'Web developer from Romania.', posts_counter: 1) }
  subject do
    Post.new(title: 'Module restart and frustrations', text: 'test', author: current_user, comments_counter: 8,
             likes_counter: 12)
  end

  before { subject.save }

  it 'title should exist' do
    expect(subject).to be_valid
  end

  it 'should not save the post without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid post if title is longer than 250 chars' do
    subject.title = 'title' * 52
    expect(subject).to_not be_valid
  end

  it 'should be valid post if comments counter is greater than 0' do
    subject.comments_counter = 5
    expect(subject).to be_valid
  end

  it 'should not be valid post if comments counter is < 0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'should not be valid post if comments counter is not integer' do
    subject.comments_counter = 5.2
    expect(subject).to_not be_valid
  end

  it 'is invalid if likes_counter is less than zero' do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end

  it 'is valid when likes_counter is positive integer' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'updates comments_counter when a comment is added' do
    initial_comments_counter = 8
    expect(subject.comments_counter).to eq(initial_comments_counter)
    subject.comments.create(post: subject, user: current_user, text: 'Test it!')
    expect(subject.comments_counter).to eq(1)
  end
end
