class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my_badges
    @user = current_user
    @badges = @user.badges
  end
end
