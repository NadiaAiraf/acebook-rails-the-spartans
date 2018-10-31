RSpec.feature 'Follow Users', type: :feature do
  scenario 'User can see that they can follow another user' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    expect(page).to have_content('Follow testuser@yahoo.com')
  end

  scenario 'User can follow others and appear on followers list' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    find('#follow').click
    visit '/users/1'
    expect(page).to have_content('Followers: testuser2@yahoo.com')
  end

  scenario 'User cannot add same follow twice' do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/users/1'
    find('#follow').click
    expect(page).to_not have_content('add testuser@yahoo.com as a follow')
  end
end
