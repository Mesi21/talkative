require 'rails_helper'
RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Mesi', photo: 'https://cdn.pixabay.com/photo/2020/05/11/15/38/tom-5158824_1280.png', bio: 'Mesi\'s biography', posts_counter: 3) }
  let!(:post1) { Post.create(author: first_user, title: 'Post #1', text: 'some text') }
  let!(:post2) { Post.create(author: first_user, title: 'Post #2', text: 'another post content') }
  let!(:post3) { Post.create(author: first_user, title: 'Post #3', text: 'a new post with some interesting stuff') }

  before do
    visit user_path(first_user)
  end

  it 'visiting the user Show page' do
    expect(page).to have_content('Mesi')
    expect(page).to have_content('Bio')
    expect(page).to have_content('Mesi\'s biography')
    expect(page).to have_link('View Posts')
  end

  it 'asserts you can see the user\'s profile picture' do
    expect(page).to have_selector('img[src="https://cdn.pixabay.com/photo/2020/05/11/15/38/tom-5158824_1280.png"]')
  end

  it 'the first three posts of the user are displayed' do
    expect(page).to have_content('Post #1')
    expect(page).to have_content('Post #2')
    expect(page).to have_content('Post #3')
  end
end
