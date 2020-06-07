defmodule MangoWeb.HomepageTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "presence of featured products", %{session: session} do
    session
    |> visit("/")
    |> page_source
    |> String.contains?("Seasonal products")
    |> assert

    # |> assert_has(Query.text("Seasonal products"))
  end
end
