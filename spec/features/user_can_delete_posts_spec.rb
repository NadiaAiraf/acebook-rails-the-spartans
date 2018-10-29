# frozen_string_literal: true

require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'Delete posts', type: :feature do
  scenario 'User can delete posts' do
    sign_up
    new_post
    find('#delete1').click
    expect(page).not_to have_content('Hello, People!')
  end

  scenario "User can't delete other people's posts" do
    sign_up
    new_post
    click_link 'Logout'
    sign_up_2
    expect { find('#delete1') }.to raise_error
  end

  scenario 'upon deletion, user stays on the homepage' do
    sign_up
    new_post
    find('#delete1').click
    expect(page).to have_content 'This is where you create a new post'
  end
end
