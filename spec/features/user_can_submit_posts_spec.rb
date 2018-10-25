require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can sign_up" do
    visit "/users/sign_up"
    fill_in "user_email", with: "testuser@yahoo.com"
    fill_in "user_password", with: "testpassword1234"
    fill_in "user_password_confirmation", with: "testpassword1234"
    click_button "Sign up"
    visit "/posts"
    expect(page).to have_content("This is where you create a new post")
  end

  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in 'user_email', with: 'aidan@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    puts 'hello'
    click_button 'Sign up'
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
