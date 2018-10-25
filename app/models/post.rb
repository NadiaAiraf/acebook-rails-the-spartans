class Post < ApplicationRecord
  def self.find_post_user(post_id)
    user_id = Post.find(post_id).user_id
    return User.find(user_id).email
  end
end
