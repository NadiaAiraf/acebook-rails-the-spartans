RSpec.feature 'Timeline', type: :feature do
  scenario 'User can sign_up' do
    sign_up
    expect(page).to have_content("Central Perk Notice Board Create a New Post")
  end

  scenario 'Can submit posts and view them' do
    sign_up
    new_post
    expect(page).to have_content('Hello, People!')
  end

  scenario 'Can see time when the post was made' do
    sign_up
    new_post
    set_times { expect(page).to have_content(post_time.strftime('%a %b %e %T')) }
  end

  scenario 'Can check that the newest post appears first' do
    sign_up
    new_post
    new_post_2
    set_times { expect(page).to have_content('Hello, Spartans! link ' + post_time.strftime('%a %b %e %T') + ' ' + 'Hello, People!') }
  end

  scenario "Users can see their email displayed next to their own posts" do
    sign_up
    new_post
    expect(page).to have_content("testuser@yahoo.com posted: Hello, People!")
  end

  scenario "Posts have a link to a page for that post" do
    sign_up
    new_post
    find('#link1').click
    expect(page).to have_content("Hello, People!")
    puts current_path
    expect(current_path).to eq '/posts/1'
  end

  scenario "Posts have a link to a Users Profile page" do
    sign_up
    new_post
    find('#profile1').click
    expect(page).to have_content("This is Your Profile Page testuser@yahoo.com Followers:")
    puts current_path
    expect(current_path).to eq '/users/1'
  end
end
