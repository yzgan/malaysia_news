require 'test_helper'
<<<<<<< HEAD
require 'minitest/mock'

class TextClassificationJobTest < ActiveJob::TestCase
  def setup
    @article = create :article
    @mock = Minitest::Mock.new
  end

  test 'enqueue jobs after article created' do
    assert_enqueued_jobs 1
    create :article
    assert_enqueued_jobs 2
  end

  test "job result in execution classify article content" do
    dummy_text = 'hello Keanu Reeves, You are breathtaking'
    sample_data = {
      categories: [
        { name: '/actor', confidence: 0.6200000047683716 },
        { name: '/Gamer/hype', confidence: 0.5799999833106995 }
      ]
    }
    response_mock = Minitest::Mock.new
    response_mock.expect(:to_h, sample_data)
    @mock.expect(:classify, response_mock, [dummy_text])

    assert_performed_jobs 1, only: TextClassificationJob do
      Google::GoogleCloudLanguage.stub(:new, @mock) do
        @new_article = create :article, content: dummy_text
      end
      @mock.verify
    end
    assert_equal sample_data.dig(:categories, 0, :name), @new_article.reload.category
  end
=======

class TextClassificationJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
>>>>>>> add job iteraction and service for text classification
end
