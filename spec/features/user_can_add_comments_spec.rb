require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'User can Comment on posts', type: :feature do
  scenario 'User can post a comment' do
    sign_up
    new_post
    click_link "link"
    fill_in 'comment[body]', with: "Pig"
    #find('#hello').set('pig')

    click_button"Create Comment"
    expect(page).to have_content('Pig')
  end
end
