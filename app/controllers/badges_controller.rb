class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my_badges

  end
end
