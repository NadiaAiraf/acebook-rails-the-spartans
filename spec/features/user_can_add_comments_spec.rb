require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'User can Comment on posts', type: :feature do
  scenario 'User can post a comment' do
    sign_up
    new_post
    click_link "Comments"
    fill_in 'comment[body]', with: "Pig"
    click_button "Create Comment"
    expect(page).to have_content('Pig')
  end

  scenario 'User can delete a comment' do
    sign_up
    new_post
    click_link "Comments"
    fill_in 'comment[body]', with: "Pig"
    click_button "Create Comment"
    expect(page).to have_content('Pig')
    click_link "delete"
    expect(page).not_to have_content('Pig')
  end
end
