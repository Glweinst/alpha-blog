require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  
  test "create new article" do
    sign_in_as(@user, "password")
    get new_article_path
    # assert_template 'articles/new'
    # assert_difference 'Articles.count', 1 do
    #   post_via_redirect articles_path, article: {name: "IntegrationTest"}
    # end
    # assert_template 'articles/index'
    assert_response :success
  end
  
end