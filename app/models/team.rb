class Team < ApplicationRecord
  has_many :users
  has_many :requests, dependent: :destroy

  MAX_SIZE = 3 # team leader is included to make 4
 
  validates :name, presence: true

  def full?
    users.count == MAX_SIZE 
  end

  def user_in_team?(user)
    users.include?(user)
  end

  def leader
    User.find(lead.to_i)
  end

  def empty?
    !users.present?
  end

  def user_requested?(user)
    Request.pluck(:user_id).include?(user.id)
  end
end
