RSpec.feature "homepage", type: :feature do
  scenario "homepage has a link to personalised feed" do
    sign_up
    click_link "Feed"
    expect(page).to have_content("You haven't followed anyone")
  end
end
