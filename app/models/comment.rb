class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
end
