defmodule Explane.Users.User do
  @keys [:name, :email, :cpf]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email, cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email) do
    {:error, "Invalid parameters"}
  end

  def build(_name) do
    {:error, "Invalid parameters"}
  end
end
