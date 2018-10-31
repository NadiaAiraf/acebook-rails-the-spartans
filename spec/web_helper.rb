# frozen_string_literal: true

def sign_up
  visit '/users/sign_up'
  fill_in 'user_email', with: 'testuser@yahoo.com'
  fill_in 'user_password', with: 'testpassword1234'
  fill_in 'user_password_confirmation', with: 'testpassword1234'
  click_button 'Sign up'
end

def sign_up_2
  visit '/users/sign_up'
  fill_in 'user_email', with: 'testuser2@yahoo.com'
  fill_in 'user_password', with: 'testpassword'
  fill_in 'user_password_confirmation', with: 'testpassword'
  click_button 'Sign up'
end

def new_post
  click_link 'New post'
  fill_in 'Message', with: 'Hello, People!'
  click_button 'Submit'
end

def set_times
  post_time = Time.now
  Timecop.freeze(post_time)
end

def logout
  click_link 'Logout'
end

def like
  find('#like1').click
end

def unlike
  find('#unlike1').click
end

def logout
  click_link 'Logout'
end

def like
  find('#like1').click
end

def unlike
  find('#unlike1').click
end
