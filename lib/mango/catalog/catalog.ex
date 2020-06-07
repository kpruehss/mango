defmodule Mango.Catalog do
  @moduledoc """
  Mango.Catalog contains functions that are closely related to the product catalog,
  such as listing all products, or listing a filtered subset of the entire catalog
  """
  alias Mango.Catalog.Product

  @doc """
  list_products/0 returns the entire catalog
  """
  def list_products do
    product1 = %Product{name: "Potato", price: 50, is_seasonal: false, category: "vegetables"}
    product2 = %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}
    [product1, product2]
  end

  @doc """
  list_seasonal_products/0 lists a subset of products that are seasonal.
  product-list is filtered via the is_seasonal boolean inside the Product struct
  """
  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn product -> product.is_seasonal end)
  end

  @doc """
  get_category_products/1 takes a category "name" string as an argument, and
  returns a filtered list of products where 'category' matches the provided 
  argument
  """
  def get_category_products(name) when is_bitstring(name) do
    list_products()
    |> Enum.filter(fn product -> product.category == name end)
  end
end
