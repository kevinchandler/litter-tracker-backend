require 'test_helper'

class LitterBoxCleaningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @litter_box_cleaning = litter_box_cleanings(:one)
  end

  test "should get index" do
    get litter_box_cleanings_url, as: :json
    assert_response :success
  end

  test "should create litter_box_cleaning" do
    assert_difference('LitterBoxCleaning.count') do
      post litter_box_cleanings_url, params: { litter_box_cleaning: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show litter_box_cleaning" do
    get litter_box_cleaning_url(@litter_box_cleaning), as: :json
    assert_response :success
  end

  test "should update litter_box_cleaning" do
    patch litter_box_cleaning_url(@litter_box_cleaning), params: { litter_box_cleaning: {  } }, as: :json
    assert_response 200
  end

  test "should destroy litter_box_cleaning" do
    assert_difference('LitterBoxCleaning.count', -1) do
      delete litter_box_cleaning_url(@litter_box_cleaning), as: :json
    end

    assert_response 204
  end
end
