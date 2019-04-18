require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_url
    assert_response :success
  end

  test "should create source" do
    assert_difference('Resource.count') do
      post resources_url, params: { source: { name: @resource.name, source_id: @resource.source_id } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test "should show source" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update source" do
    patch resource_url(@resource), params: { source: { name: @resource.name, source_id: @resource.source_id } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy source" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
