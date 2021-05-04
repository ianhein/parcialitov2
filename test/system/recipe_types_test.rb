require "application_system_test_case"

class RecipeTypesTest < ApplicationSystemTestCase
  setup do
    @recipe_type = recipe_types(:one)
  end

  test "visiting the index" do
    visit recipe_types_url
    assert_selector "h1", text: "Recipe Types"
  end

  test "creating a Recipe type" do
    visit recipe_types_url
    click_on "New Recipe Type"

    fill_in "Description", with: @recipe_type.description
    fill_in "Name", with: @recipe_type.name
    click_on "Create Recipe type"

    assert_text "Recipe type was successfully created"
    click_on "Back"
  end

  test "updating a Recipe type" do
    visit recipe_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @recipe_type.description
    fill_in "Name", with: @recipe_type.name
    click_on "Update Recipe type"

    assert_text "Recipe type was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe type" do
    visit recipe_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe type was successfully destroyed"
  end
end
