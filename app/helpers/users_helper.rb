module UsersHelper
  def team_lead?(team)
    current_user == team.leader
  end

  def can_join_team?(team)
    !current_user.in_team? and !team.user_requested?(current_user)
  end
end
