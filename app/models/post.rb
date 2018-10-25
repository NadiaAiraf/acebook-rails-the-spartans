class Post < ApplicationRecord
  def self.find_post_user(user)
    user_id = Post.find(user).user_id
    return User.find(user_id).email
  end
end
