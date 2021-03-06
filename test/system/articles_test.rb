require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "updating a Article" do
    visit articles_url
    click_on "Edit", match: :first

    fill_in "Author", with: @article.author
    fill_in "Content", with: @article.content
    fill_in "Description", with: @article.description
    fill_in "Search", with: @article.search_id
    fill_in "Title", with: @article.title + '-updated'
    fill_in "Url", with: @article.url
    fill_in "Url to image", with: @article.url_to_image
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "destroying a Article" do
    visit articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article was successfully destroyed"
  end
end
