require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'Like posts', type: :feature do
  scenario 'User likes a post and it appears' do
    sign_up
    new_post
    like
    expect(page).to have_content('1 Likes')
  end

  scenario 'Multiple users can like a post' do
    sign_up
    new_post
    like
    expect(page).to have_content('1 Likes')
    logout
    sign_up_2
    like
    expect(page).not_to have_content('1 Likes')
    expect(page).to have_content('2 Likes')
  end

  scenario "User can unlike something they previously thought was quite good but now they don't think is very good" do
    sign_up
    new_post
    like
    expect(page).to have_content('1 Likes')
    unlike
    expect(page).to have_content('0 Likes')
  end

  scenario "Like button switches to unlike button when user likes something cool" do
    sign_up
    new_post
    like
    expect(page).to have_content('Unlike')
    unlike
    expect(page).to have_content('Like')
  end

end
