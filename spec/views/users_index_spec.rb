require 'rails_helper'

describe 'User Index Page Features', type: :feature, js: true do
  before :each do
    @new_user = User.create(
      name: 'Mesi Molnar',
      photo: 'https://unsplash.com/photos/woman-wearing-black-camisole-top-walking-on-grass-field-during-sunrise-2FrX56QL7P8',
      bio: 'Description of the first user\'s biography.',
      posts_counter: 2
    )
  end

  it 'can lists the username of all other users' do
    visit users_path
    expect(page).to have_all_of_selectors('.all-users')
  end

  it 'can list the profile picture of every users' do
    visit users_path
    expect(page).to have_all_of_selectors('.user-photo')
  end

  it 'can lists the number of posts of the user' do
    visit users_path
    expect(page).to have_all_of_selectors('.card-text')
  end

  it 'redirects to the user\'s show page' do
    visit users_path
    click_link(href: user_path(@new_user.id))
    expect(page).to have_current_path(user_path(@new_user.id))
  end
end