require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @upload = uploads(:one)
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, :upload => @upload.attributes
    end
    assert_response 200
  end

  test "should show upload" do
    get :show, :id => @upload.to_param
    assert_response :success
  end

  test "should respond to show_uploaded" do
    xhr :get, :show_uploaded
    assert_response :success
  end

  test "should update upload" do
    put :update, :id => @upload.to_param, :upload => @upload.attributes
    assert_redirected_to root_path
  end

  test "should destroy upload" do
    assert_difference('Upload.count', -1) do
      delete :destroy, :id => @upload.to_param
    end
    assert_response :success
  end

  test "should update description" do
   xhr :post, :desc_update, :upload_id => @upload.to_param, :description => 'Some desc'
   assert_response :success
  end

end
