module ApplicationHelper

  def fix_url(str)
    str.start_with?('http') ? str : "http://#{str}"
  end

  def pretty_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.strftime("%m/%d/%Y %I:%M%P %Z")
  end

end
