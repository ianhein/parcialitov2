require "test_helper"

class RecipeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_type = recipe_types(:one)
  end

  test "should get index" do
    get recipe_types_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_type_url
    assert_response :success
  end

  test "should create recipe_type" do
    assert_difference('RecipeType.count') do
      post recipe_types_url, params: { recipe_type: { description: @recipe_type.description, name: @recipe_type.name } }
    end

    assert_redirected_to recipe_type_url(RecipeType.last)
  end

  test "should show recipe_type" do
    get recipe_type_url(@recipe_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_type_url(@recipe_type)
    assert_response :success
  end

  test "should update recipe_type" do
    patch recipe_type_url(@recipe_type), params: { recipe_type: { description: @recipe_type.description, name: @recipe_type.name } }
    assert_redirected_to recipe_type_url(@recipe_type)
  end

  test "should destroy recipe_type" do
    assert_difference('RecipeType.count', -1) do
      delete recipe_type_url(@recipe_type)
    end

    assert_redirected_to recipe_types_url
  end
end
