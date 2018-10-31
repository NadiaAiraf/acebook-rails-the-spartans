RSpec.feature 'Like posts', type: :feature do
  scenario 'User likes a post and it appears' do
    sign_up
    new_post
    like
    expect(page).to have_content('testuser@yahoo.com likes this')
  end

  scenario 'Multiple users can like a post' do
    sign_up
    new_post
    like
    expect(page).to have_content('testuser@yahoo.com likes this')
    expect(page).not_to have_content('testuser2@yahoo.com likes this')
    logout
    sign_up_2
    like
    expect(page).to have_content('testuser@yahoo.com and testuser2@yahoo.com like this')
  end

  scenario "User can unlike something they previously thought was quite good but now they don't think is very good" do
    sign_up
    new_post
    like
    expect(page).to have_content('testuser@yahoo.com likes this')
    unlike
    expect(page).to have_content('no one likes this')
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
