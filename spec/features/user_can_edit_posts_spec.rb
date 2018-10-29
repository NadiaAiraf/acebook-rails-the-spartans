require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do
    sign_up
    new_post
    expect(page).to have_content("Hello, People!")
    click_on'Edit Post'
    fill_in'Message', with: "Fluffy Pig"
    click_button "Update!"
    expect(page).not_to have_content("Hello, People!")
    expect(page).to have_content("Fluffy Pig")
  end

  scenario "Users can only edit own post" do
    sign_up
    new_post
    expect(page).to have_content("Hello, People!")
    expect(page).to have_link('Edit Post')
    click_on('Logout')
    sign_up_2
    expect(page).to have_content("Hello, People!")
    expect(page).not_to have_link('Edit Post')
  end
end
