class ApplicationController < ActionController::Base
  before_action :set_locale

  def after_sign_in_path_for(_user)
    current_user.admin? ? admin_tests_path : tests_path
  end

  def default_url_options
    if I18n.locale != I18n.locale
      { lang: I18n.locale }
    else
      {}
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
