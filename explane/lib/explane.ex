defmodule Explane do
  alias Explane.Users.Agent, as: UserAgent
  alias Explane.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
