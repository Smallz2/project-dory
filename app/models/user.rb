class User < ApplicationRecord
  belongs_to :team, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 
  
  def is_team_lead?
    Team.pluck(:lead).map(&:to_i).include?(id)
  end

  def team_leading
    Team.find_by_lead(id.to_s)
  end

  def in_team?
    Team.joins(:users).pluck(:id).include?(id) or Team.pluck(:lead).map(&:to_i).include?(id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def team_request
    Request.find_by_user_id(id.to_s)
  end
end
