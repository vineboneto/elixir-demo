defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Rua John Doe",
      age: 22,
      cpf: "12345",
      email: "vineboneto@gmail.com",
      name: "vinicius"
    }
  end
end
