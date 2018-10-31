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

  def facebook_likes
    names = likers(User).map{ |user| user.email }
    a = names.length
    if a == 0
    return "no one likes this"
    end
    if a == 1
    return "#{names[0]} likes this"
    end
    if a == 2
    return "#{names[0]} and #{names[1]} like this"
    end
    if a == 3
    return "#{names[0]}, #{names[1]} and #{names[2]} like this"
    end
    if a >= 4
    return "#{names[a-1]}, #{names[a-2]} and #{a-2} others like this"
    end
  end
end
