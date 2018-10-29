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

  scenario 'Edited posts display latest time' do
    sign_up
    Timecop.freeze(Time.zone.parse('12:00 13 October 2018'))
    new_post
    expect(page).to have_content("Hello, People!")
    expect(page).to have_content('Sat Oct 13 12:00:00')
    Timecop.freeze(Time.zone.parse('12:45 13 October 2018'))
    click_on('Edit Post')
    fill_in('Message', with: 'lots of changes to post')
    click_button('Update!')
    expect(page).not_to have_content('Hello, People!')
    expect(page).not_to have_content('Sat Oct 13 12:00:00')
    expect(page).to have_content('Sat Oct 13 12:45:00')
  end
end
