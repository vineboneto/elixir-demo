defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      address: "Rua John Doe",
      age: 22,
      cpf: "12345",
      email: "vineboneto@gmail.com",
      name: "vinicius"
    }
  end

  def item_factory do
    %Item{
      category: :sobremesa,
      description: "Sorvete",
      quantity: 20,
      unity_price: Decimal.new("10.50")
    }
  end
end
