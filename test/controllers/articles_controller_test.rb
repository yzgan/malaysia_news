require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @article_build = build(:article)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: {
      article: {
        author: @article_build.author,
        content: @article_build.content,
        description: @article_build.description,
        published_at: @article_build.published_at,
        search_id: @article_build.search_id,
        title: @article_build.title,
        url: @article_build.url,
        url_to_image: @article_build.url_to_image
      }
    }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
