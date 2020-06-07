defmodule MangoWeb.Acceptance.CategoryPageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  setup do
    ## GIVEN ##
    # There are two products, Apple and Potato, priced 100 and 50
    # categorized under 'fruits' and 'vegetables' respectively
    :ok
  end

  test "show fruits" do
    ## WHEN ##
    # I navigate to the fruits page
    navigate_to("/categories/fruits")

    ## THEN ##
    # I expect the apge title to be "Fruits"
    page_title = find_element(:css, ".product") |> visible_text()
    assert page_title == "Fruits"

    # And I expect Apple in the product display
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"

    # And I expect it's price of 100 to be displayed on screen
    assert product_price == "100"

    # And I expect that Potato is not present on screen
    refute page_source() =~ "Potato"
  end

  test "show vegetables" do
    ## WHEN ##
    # I navigate to vegetables page
    navigate_to("/categories/vegetables")

    ## THEN ##
    # I expect the pge title to be "Vegetables"
    page_title = find_element(:css, ".product") |> visible_text()
    assert page_title == "Vegetables"

    # And I expect Apple in the product display
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Potato"

    # And I expect it's price of 100 to be displayed on screen
    assert product_price == "50"

    # And I expect that Potato is not present on screen
    refute page_source() =~ "Apple"
  end
end
