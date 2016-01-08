require 'test_helper'

class FamilyGroupsControllerTest < ActionController::TestCase
  setup do
    @family_group = family_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_group" do
    assert_difference('FamilyGroup.count') do
      post :create, family_group: { family_name: @family_group.family_name }
    end

    assert_redirected_to family_group_path(assigns(:family_group))
  end

  test "should show family_group" do
    get :show, id: @family_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @family_group
    assert_response :success
  end

  test "should update family_group" do
    patch :update, id: @family_group, family_group: { family_name: @family_group.family_name }
    assert_redirected_to family_group_path(assigns(:family_group))
  end

  test "should destroy family_group" do
    assert_difference('FamilyGroup.count', -1) do
      delete :destroy, id: @family_group
    end

    assert_redirected_to family_groups_path
  end
end
