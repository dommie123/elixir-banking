defmodule UserInput do
  @moduledoc """
    This is a custom module designed to read input from the
    user and format it in a way that the system can easily
    interpret, either by converting it to an integer or
    decimal number. In Elixir, the newline character, `\\n`,
    is included with the user input, and the below functions
    aim to remove that, making it easier to format the input.
  """
  @moduledoc since: "1.0.0"

  @doc """
    Reads input from the user and converts it into an integer.
    This allows the program to understand it more easily as
    it is processed. If the user does not enter a number,
    they are prompted to do so to prevent application errors.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def read(has_error \\ false) do
    message = case has_error do
      false -> ">>> "
      true -> "Please enter a number: "
    end

    input = IO.gets(message)
    input = String.trim(input, "\n")

    String.to_integer(input)
  rescue
    ArgumentError -> read(true)  # Prompt the user to enter a number instead of a string
    FunctionClauseError -> read(true)  # Prompt the user to enter a number instead of a string
  end

  @doc """
    Reads input from the user and converts it into a floating
    point number. This allows the program to understand it more
    easily as it is processed for basic bank functionality. If
    the user does not enter a floating point number, they are
    prompted to do so to prevent application errors.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def read_float(has_error \\ false) do
    message = case has_error do
      false -> ">>> "
      true -> "Please enter a decimal number: "
    end

    input = IO.gets(message)
    input = String.trim(input, "\n")

    String.to_float(input)
  rescue
    ArgumentError -> read_float(true)  # Prompt the user to enter a decimal instead of a string
    FunctionClauseError -> read_float(true)  # Prompt the user to enter a decimal instead of a string
  end
end
