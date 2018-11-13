module SessionsHelper
  def flash_message
    flashes = flash.map do |key, message|
      render partial: 'shared/alert', locals: { text: message, css_class: key }
    end
    safe_join flashes
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
