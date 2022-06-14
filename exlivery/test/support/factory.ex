defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

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

  def order_factory do
    %Order{
      delivery_address: "Rua John Doe",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("251.00"),
      user_cpf: "12345"
    }
  end
end
