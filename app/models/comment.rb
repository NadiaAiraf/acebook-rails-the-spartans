class Comment < ApplicationRecord
  attr_accesssible :body, :post
  belongs_to :post

end
