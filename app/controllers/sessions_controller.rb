class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Try to login again?'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
