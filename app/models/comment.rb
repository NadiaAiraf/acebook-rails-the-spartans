class Comment < ApplicationRecord
   attr_accessor :body, :post
  belongs_to :post

end
