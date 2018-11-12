module SessionsHelper
  def flash_text(key, message)
    flash[key] ||= message unless message.blank?
  end

  def flash_text_now(key, message)
    flash.now[key] ||= message unless message.blank?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
