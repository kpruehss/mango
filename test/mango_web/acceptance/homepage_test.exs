defmodule MangoWeb.HomepageTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "presence of featured products", %{session: session} do
    ## GIVEN ##
    # There are two products, Apple and Tomato, pracied at 100 and 50
    # respectively with Apple being the only seasonal product

    ## WHEN ##
    # I navigate to homepage
    session
    |> visit("/")

    # |> page_source
    # |> String.contains?("Seasonal products")
    # |> assert

    ## THEN ##
    # I expect the page title to be "Seasonal products"
    page_title = page_title(session)
    assert page_title == "Seasonal products"
  end
end
