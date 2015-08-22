require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get email:string" do
    get :email:string
    assert_response :success
  end

  test "should get image_url:string" do
    get :image_url:string
    assert_response :success
  end

  test "should get admin:boolean" do
    get :admin:boolean
    assert_response :success
  end

  test "should get soundfriend:boolean" do
    get :soundfriend:boolean
    assert_response :success
  end

  test "should get instagram:string" do
    get :instagram:string
    assert_response :success
  end

  test "should get twitter:string" do
    get :twitter:string
    assert_response :success
  end

end
