require './spec/rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(name: 'Mesi', photo: 'https://unsplash.com/photos/man-in-front-of-laptop-computer-in-shallow-focus-photography-LNRyGwIJr5c', bio: 'Web developer from Romania.', posts_counter: 1)}

  before { subject.save}

  it 'user should be valid' do
    expect(subject).to be_valid
  end

  it 'user should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer greater than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 1.25
    expect(subject).to_not be_valid
  end
end