module ApplicationHelper
  def format_date(date)
    date.strftime("%b %-d, %Y")
  end

  def blank_to_human(potential_blank)
    potential_blank.present? ? potential_blank : "nothing to show"
  end

end
