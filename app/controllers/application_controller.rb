class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_user)
    return admin_tests_path if current_user.admin?

    tests_path
  end
end
