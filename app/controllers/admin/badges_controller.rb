class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: :destroy

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :rule_id)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
