module ApplicationHelper

  def fix_url(str)
    str.start_with?('http') ? str : "http://#{str}"
  end

  def pretty_time(time)
    time.strftime("%m/%d/%Y %I:%M%P %Z ")
  end

end
