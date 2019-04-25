require 'test_helper'
require 'minitest/mock'

class ArticleDecoratorTest < Draper::TestCase
  setup do
    @article = articles(:one)
    @decorated_article = @article.decorate
    @new_badge_html = "<span class=\"new badge btn-floating pulse\"></span>"
    @mock = Minitest::Mock.new
  end

  test 'recent badge' do
    assert_not_nil @article.decorate.recent_badge
    assert @article.recent?
    assert_equal @new_badge_html, @article.decorate.recent_badge
  end

  test 'created at' do
    @mock.expect(:strftime, true, ['%A, %B %e at %I:%M%p'])
    @article.stub(:created_at, @mock) do
      assert @article.decorate.created_at
    end
    @mock.verify
  end

  test 'url_to_image' do
    assert @article.valid_image_url?
    assert_match /\Ahttps?/, @article.decorate.url_to_image
    @article.url_to_image = 'invalid url'
    assert_nil @article.decorate.url_to_image
  end

  test 'tooltip' do
    assert_match /\A<p>?.*<\/p>/im, @article.decorate.tooltip
  end
end
