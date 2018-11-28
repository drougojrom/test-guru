class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  def initialize
    @client = setup_http_client
  end

  def create_gist(params)
    response = @client.create_gist(params)
  end

  private

  def setup_http_client
    @client = Octokit::Client.new(:access_token => "#{ACCESS_TOKEN}")
  end
end
