require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @food = foods(:one)
    sign_in @user
  end

  test 'should get index' do
    get foods_url
    assert_response :success
  end

  test 'should get new' do
    get new_food_url
    assert_response :success
  end

  test 'should create food' do
    assert_difference('Food.count') do
      post foods_url, params: { food: { name: 'New Food', measurement_unit: 'lbs', price: 2.50, quantity: 1 } }
    end

    assert_redirected_to foods_path
    assert_equal 'Food was successfully created.', flash[:notice]
  end

  test 'should not create food with invalid params' do
    assert_no_difference('Food.count') do
      post foods_url, params: { food: { name: nil, measurement_unit: 'lbs', price: 2.50, quantity: 1 } }
    end

    assert_template :new
    assert_equal 'Food could not be created.', flash[:alert]
  end

  test 'should show food' do
    get food_url(@food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_food_url(@food)
    assert_response :success
  end

  test 'should update food' do
    patch food_url(@food), params: { food: { name: 'Updated Food' } }
    assert_redirected_to foods_path
    assert_equal 'Food item successfully updated!', flash[:success]
    @food.reload
    assert_equal 'Updated Food', @food.name
  end

  test 'should not update food with invalid params' do
    patch food_url(@food), params: { food: { name: nil } }
    assert_template :edit
    assert_equal 'Food item update failed!', flash.now[:error]
    @food.reload
    assert_not_equal nil, @food.name
  end

  test 'should destroy food' do
    assert_difference('Food.count', -1) do
      delete food_url(@food)
    end

    assert_redirected_to foods_path
    assert_equal 'Food was successfully destroyed.', flash[:notice]
  end

  test 'should get shopping list' do
    get shopping_list_foods_url
    assert_response :success
  end
end
