require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature 'Like posts', type: :feature do
  scenario 'User likes a post and it appears' do
    sign_up
    new_post
    find('#like1').click
    expect(page).to have_content('likes: 1')
  end
end
