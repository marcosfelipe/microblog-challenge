class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_and_belongs_to_many :friends,
                          class_name: 'User',
                          join_table:  :friendships,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_id
  def following
    friends.count
  end

  def followers
    Friendship.where(friend_id: id).count
  end
end
