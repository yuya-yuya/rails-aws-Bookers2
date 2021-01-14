require 'test_helper'

class PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get books" do
    get post_images_books_url
    assert_response :success
  end

end
