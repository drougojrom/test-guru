module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to(repo.capitalize.to_s, "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def flash_message
    flashes = flash.map do |key, message|
      render partial: 'shared/alert', locals: { text: message, css_class: key }
    end
    safe_join flashes
  end
end
