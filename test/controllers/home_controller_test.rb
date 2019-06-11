require 'test_helper'
require 'minitest/mock'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @mock = Minitest::Mock.new
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get search" do
    get query_path, params: { search: 'avenger', page: 1 }
    assert_response :success
  end

  test 'should get top headlines json data' do
    @mock.expect(:top_headlines, response_data)
    NewsApiServices.stub(:new, @mock) do
      get top_headlines_path
    end
    @mock.verify
    assert_response :success
  end

  private

  def response_data
    YAML.safe_load(File.open(Rails.root.join('lib', 'seeds', 'test', 'news_api_response.yml')))
  end
end
