require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new' # this is where we want to ensure the path goes to
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "} #not post_via_redirect because it is going back to same page, although
    end                                              #both commands would work
    assert_template 'categories/new'
    assert_select "h2.panel-title" #this is to ensure an error message pops up. we find this from error partial in views
    assert_select "div.panel-body"     #where it summons error message
  end
  
end