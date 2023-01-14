module ApplicationHelper
  def bootstrap_alert(key)
    case key
    when "danger"
      "danger"
    when "alert"
      "warning"
    when "notice"
      "success"
    when "error"
      "danger"
    end
  end
end
