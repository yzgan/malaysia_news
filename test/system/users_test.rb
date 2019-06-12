require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index in the morning" do
    Timecop.travel DateTime.current.beginning_of_day + 6.hours
    visit root_path

    assert page.has_content? 'Good Morning, Malaysia'
  end

  test "visiting the index in the afternoon" do
    Timecop.travel DateTime.current.at_noon
    visit root_path

    assert page.has_content? 'Good Afternoon, Malaysia'
  end

  test "visiting the index in the evening" do
    Timecop.travel DateTime.current.at_noon + 6.hours
    visit root_path

    assert page.has_content? 'Good Evening, Malaysia'
  end

  test "visiting the index in the evening" do
    Timecop.travel DateTime.current.at_noon + 10.hours
    visit root_path

    assert page.has_content? 'Good Night, Malaysia'
  end
end
