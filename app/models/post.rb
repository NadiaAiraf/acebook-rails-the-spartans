class Post < ApplicationRecord
  belongs_to :user
  acts_as_mentioner
  acts_as_likeable

  def user_username
    user.username
  end
end
