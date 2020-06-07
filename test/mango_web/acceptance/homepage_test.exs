defmodule MangoWeb.HomepageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test("presence of featured product") do
    navigate_to("/")

    assert page_source() =~ "Seasonal products"
  end
end

