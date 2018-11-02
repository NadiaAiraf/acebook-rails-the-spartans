RSpec.feature "Personlised news feed", type: :feature do
  scenario "Can visit a personalised feed" do
    sign_up
    visit "/feed"
    expect(page).to have_content("Your 's Posts!")
  end

  scenario "User sees no posts when they haven't followed anyone" do
    sign_up
    visit "/feed"
    expect(page).to have_content("You haven't followed anyone")
  end

  scenario "User can choose to return to homepage" do
    sign_up
    visit "/feed"
    expect(page).to have_content("You haven't followed anyone")
    click_link('back')
    expect(page).to have_current_path('/')
  end

  scenario "User can see post of someone they follow" do
    sign_up
    new_post
    logout
    sign_up_2
    find('#profile1').click
    find('#follow').click
    visit '/feed'
    expect(page).to have_content("Hello, People!")
  end

  scenario "Main feed does not affect personal feed" do
    sign_up
    new_post
    logout
    sign_up_2
    visit '/feed'
    expect(page).to have_content("You haven't followed anyone")
  end
end
