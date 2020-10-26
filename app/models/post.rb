class Post < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  scope :by, ->(user_ids) { where(user_id: user_ids) }
end
