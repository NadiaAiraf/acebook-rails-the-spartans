# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def user_username
    user.username
  end
end
