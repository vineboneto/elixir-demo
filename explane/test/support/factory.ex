defmodule Explane.Factory do
  use ExMachina

  alias Explane.Users.User

  def user_factory do
    %User{
      name: "vinicius",
      email: "vineboneto@gmail.com",
      cpf: "12345"
    }
  end
end
