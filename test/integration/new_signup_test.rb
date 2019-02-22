require 'test_helper'

class NewSignupTest < ActionDispatch::IntegrationTest
  
  test "user should be able to sign up" do
    get signup_path
    assert_response :success
  end

end
  