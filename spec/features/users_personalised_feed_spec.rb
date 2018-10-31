RSpec.feature "Personlised news feed", type: :feature do
  scenario "Can visit a personalised feed" do
    sign_up
    visit "/feed"
    expect(page).to have_content("Personalised feed")

  end
end
