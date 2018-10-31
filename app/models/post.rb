# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_likeable

  def user_username
    user.username
  end

  def display_date
    if updated_at == nil
      t = created_at.in_time_zone("London")
      t.strftime("%a %b %e %T")
    else
      t = updated_at.in_time_zone("London")
      t.strftime("%a %b %e %T")
    end
  end

  def correct_likes
    if likers(User).count == 1
      return "1 Like"
    else
      return "#{likers(User).count} Likes"
    end
  end

end
