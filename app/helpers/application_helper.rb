module ApplicationHelper
  def format_date(date)
    date.strftime("%b %-d, %Y")
  end

  def blank_to_human(potential_blank)
    potential_blank.present? ? potential_blank : "nothing to show"
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end  

end
