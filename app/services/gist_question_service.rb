class GistQuestionService
  attr_accessor :result

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @result = @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: "#{I18n.t('test_passages.gist.question_title')} #{@test.title}",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end
