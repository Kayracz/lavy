require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get stars:integer" do
    get reviews_stars:integer_url
    assert_response :success
  end

  test "should get description" do
    get reviews_description_url
    assert_response :success
  end

  test "should get order_id:references" do
    get reviews_order_id:references_url
    assert_response :success
  end

end
