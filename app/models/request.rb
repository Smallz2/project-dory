class Request < ApplicationRecord
  belongs_to :user
  belongs_to :team

  def user_name
    "#{user.first_name}"
  end
end
