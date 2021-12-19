require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  include CleanableTest

  setup do
    @article_build = build :article
    @article = create :article
    @invalid_urls = [nil, 'invalid url']
    @valid_urls = ['https://malaysianews.com', 'http://malaysianews.com']
  end

  context 'associations' do
    should belong_to :search
    should belong_to :resource
  end

  context 'validations' do
    should validate_presence_of :title
    should validate_uniqueness_of :title
  end

  should include PgSearch::Model

  test 'valid article' do
    assert @article_build.valid?
  end

  test 'recent?' do
    assert @article.recent?
    Timecop.freeze(Time.current + 2.hours) do
      assert_not @article.recent?
    end
  end

  test 'valid_image_url?' do
    @invalid_urls.each do |url|
      @article.url_to_image = url
      assert_not @article.valid_image_url?
    end

    @valid_urls.each do |url|
      @article.url_to_image = url
      assert @article.valid_image_url?
    end
  end
end
