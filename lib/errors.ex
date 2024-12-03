defmodule OverdraftError do
  @moduledoc """
    This is a custom error that is meant to occur when the user tries to withdraw more
    money than they have from either their checking or their savings
    accounts.
  """
  @moduledoc since: "1.0.0"
  defexception message: "You do not have sufficient funds to make a withdrawal!"
end
