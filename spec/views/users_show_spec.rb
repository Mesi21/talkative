require 'rails_helper'

RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Mesi', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Mesi\'s biography', posts_counter: 3) }
  let!(:post1) { Post.create!(author: first_user, title: 'Post #1', text: 'some text', comments_counter:2, likes_counter: 1) }
  let!(:post2) { Post.create!(author: first_user, title: 'Post #2', text: 'another post content', comments_counter:2, likes_counter: 1) }
  let!(:post3) { Post.create!(author: first_user, title: 'Post #3', text: 'a new post with some interesting stuff', comments_counter:3, likes_counter: 0) }
  let!(:post4) { Post.create!(author: first_user, title: 'Post #4', text: 'a post that should not be present on this page', comments_counter:5, likes_counter: 10) }

  before do
    visit user_path(first_user)
  end

  it 'On the users_show page' do
    expect(page).to have_content('Mesi')
    expect(page).to have_content('Mesi\'s biography')
    expect(page).to have_link('Back')
    expect(page).to have_link('View more posts')
  end

  it 'asserts you can see the user\'s profile picture' do
    expect(page).to have_selector('img[src="https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM"]')
  end

  it 'the first three posts of the user are displayed' do
    expect(page.body).to include(post3.title)
  end

  it 'expect the oldes post not to be displayed on this page' do
    expect(page.body).not_to include(post1.title)
  end

  it 'displays the user\'s last three posts' do
  end
end
