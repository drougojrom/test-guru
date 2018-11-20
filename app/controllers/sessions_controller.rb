class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome back, #{current_user.full_name}" if is_flashing_format?
  end
end
