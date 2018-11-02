
RSpec.feature 'User can link to posts', type: :feature do
  scenario "User clicks post link" do
    sign_up
    new_post
    click_link 'Comments'
    expect(page).to have_content("Add a comment")
    expect(page).to have_content("Hello, People!")
    expect(page).to have_current_path('/posts/1')
  end
end
