require 'test_helper'

class MovesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get moves_index_url
    assert_response :success
  end

  test 'should get new' do
    get moves_new_url
    assert_response :success
  end

  test 'should get show' do
    get moves_show_url
    assert_response :success
  end

  test 'should get create' do
    get moves_create_url
    assert_response :success
  end

  test 'should get update' do
    get moves_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get moves_destroy_url
    assert_response :success
  end

  test 'should get edit' do
    get moves_edit_url
    assert_response :success
  end
end
