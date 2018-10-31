RSpec.feature "Personlised news feed", type: :feature do
  scenario "Can visit a personalised feed" do
    sign_up
    visit "/feed"
    expect(page).to have_content("Personalised feed")
  end

  scenario "User sees no posts when they haven't followed anyone" do
    sign_up
    visit "/feed"
    expect(page).to have_content("You haven't followed anyone")
  end
end
