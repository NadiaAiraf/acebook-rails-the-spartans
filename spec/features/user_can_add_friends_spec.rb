RSpec.feature 'Like posts', type: :feature do
  scenario 'User can see that they can add another user as a friend' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    expect(page).to have_content('add testuser@yahoo.com as a friend')
  end

  scenario 'User can add friend and have them appear on friends list' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    find('#addfriend').click
    visit '/users/2'
    expect(page).to have_content('friends: testuser@yahoo.com')
  end

  scenario 'User cannot add same friend twice' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    find('#addfriend').click
    expect(page).to_not have_content('add testuser@yahoo.com as a friend')
  end
end
