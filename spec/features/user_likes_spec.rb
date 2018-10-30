require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'Like posts', type: :feature do
  scenario 'User likes a post and it appears' do
    sign_up
    new_post
    like
    expect(page).to have_content('likes: 1')
  end

  scenario 'User can only like each post once' do
    sign_up
    new_post
    like
    like
    expect(page).to have_content('likes: 1')
    expect(page).not_to have_content('likes: 2')
  end

  scenario 'Multiple users can like a post' do
    sign_up
    new_post
    like
    expect(page).to have_content('likes: 1')
    logout
    sign_up_2
    like
    expect(page).not_to have_content('likes: 1')
    expect(page).to have_content('likes: 2')
  end

  scenario "User can unlike something they previously thought was quite good but now they don't think is very good" do
    sign_up
    new_post
    like
    expect(page).to have_content('likes: 1')
    like
    expect(page).to have_content('likes: 0')
  end



end
