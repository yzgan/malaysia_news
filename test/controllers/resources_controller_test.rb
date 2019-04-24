require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
    @resource_build = build(:resource)
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
      post resources_url, params: { resource: { name: @resource_build.name, source_id: @resource_build.source_id } }
    end

    assert_redirected_to resource_url(Resource.last)
    assert_equal 'Resource was successfully created.', flash[:notice]
  end

  test "should show source" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { name: @resource.name, source_id: @resource.source_id } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
