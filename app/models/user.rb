# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  acts_as_followable
  acts_as_follower
  acts_as_liker
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # attr_writer :login
  #
  # def login
  #   @login || self.username || self.email
  # end
end
