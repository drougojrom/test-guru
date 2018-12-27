class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my_badges
    @badges = current_user.badges
  end
end
