require 'rails_helper'
require 'timecop'
require 'web_helper'

RSpec.feature "Delete posts", type: :feature do
  scenario "User can delete posts" do
    sign_up
    new_post
    find("#delete1").click
    expect(page).not_to have_content("Hello, People!")
  end

  scenario "User can't delete other's people's posts" do
    sign_up
    new_post
    click_link "Logout"
    sign_up_2
    expect{ find('#delete1') }.to raise_error
  end





 #  scenario "Can submit posts and view them" do
 #    sign_up
 #    new_post
 #
 #  end
 #
 #  scenario "Can see time when the post was made" do
 #    sign_up
 #    new_post
 #    set_times {expect(page).to have_content(post_time.strftime("%a %b %e %T"))}
 # end
 #
 #  scenario "Can check that the newest post appears first" do
 #   sign_up
 #   new_post
 #   click_link "New post"
 #   fill_in "Message", with: "Hello, Spartans!"
 #   click_button "Submit"
 #   set_times {expect(page).to have_content("Hello, Spartans! link " + post_time.strftime("%a %b %e %T")+ " " + "Hello, People!")}
 # end
end
