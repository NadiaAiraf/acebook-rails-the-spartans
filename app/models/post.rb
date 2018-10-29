class Post < ApplicationRecord
  belongs_to :user

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

end
