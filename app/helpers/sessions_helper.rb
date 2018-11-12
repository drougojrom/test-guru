module SessionsHelper
  def flash_text(key, message)
    flash[key] ||= message unless message.blank?
  end

  def flash_text_now(key, message)
    flash.now[key] ||= message unless message.blank?
  end
end
