require 'test_helper'

class LitterBoxEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @litter_box_entry = litter_box_entries(:one)
  end

  test "should get index" do
    get litter_box_entries_url, as: :json
    assert_response :success
  end

  test "should create litter_box_entry" do
    assert_difference('LitterBoxEntry.count') do
      post litter_box_entries_url, params: { litter_box_entry: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show litter_box_entry" do
    get litter_box_entry_url(@litter_box_entry), as: :json
    assert_response :success
  end

  test "should update litter_box_entry" do
    patch litter_box_entry_url(@litter_box_entry), params: { litter_box_entry: {  } }, as: :json
    assert_response 200
  end

  test "should destroy litter_box_entry" do
    assert_difference('LitterBoxEntry.count', -1) do
      delete litter_box_entry_url(@litter_box_entry), as: :json
    end

    assert_response 204
  end
end
