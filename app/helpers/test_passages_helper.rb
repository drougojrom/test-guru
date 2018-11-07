module TestPassagesHelper
  def result_success?(test_passage)
    test_passage.result >= 85
  end
end
