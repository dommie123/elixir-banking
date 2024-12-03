defmodule GUI do
  @moduledoc """
    This module is solely responsible for writing information to the console
    and outputting various display elements, such as headers and bullet points,
    to the screen. Without this module, almost all of the app's functionality
    could not exist or prove to be reliable to the user, as there would be no
    information for them to view.
  """
  @moduledoc since: "1.0.0"

  @doc """
    Prints a main menu to the screen, allowing the user to choose from a list
    of options that each support a different part of the application's functionality.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_welcome_screen do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " 1 - View Account Balance"
    IO.puts " 2 - Make a Deposit"
    IO.puts " 3 - Make a Withdrawal"
    IO.puts " 4 - View App Information"
    IO.puts " 0 - Exit program"
    IO.puts "\n*************************************"
  end

  @doc """
    Prints the user's account information to the screen for
    easy access.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_account_balance(checking, savings) do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " Checking: #{checking}"
    IO.puts " Savings: #{savings}\n"
    IO.puts " Enter 0 to go back... "
    IO.puts "\n*************************************"
  end

  def draw_deposit(amount, option) when amount == -1 and option == -1 do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " 1 - Checking "
    IO.puts " 2 - Savings "
    IO.puts " 0 - Go Back "
    IO.puts "\n*************************************"
  end

  def draw_deposit(amount, _option) when amount == -1 do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " How much would you like to deposit?"
    IO.puts " Enter 0 to go back..."
    IO.puts "\n*************************************"
  end

  @doc """
    When the user first chooses to make a deposit into one of their
    accounts (in other words, when they have not yet chosen an account
    or amount to deposit), prints a prompt to choose an account for
    which to make the deposit onto the screen, allowing the user to
    make a decision.

    When the user chooses an account for which to make a deposit,
    prints a prompt to the screen asking them for the amount to
    deposit. In the real world, they would have to bring money.
    However, since this is a mockup, the user can simply type any
    dollar amount and it will be accepted.

    When the user chooses an amount to deposit and an account
    to deposit the amount into, prints a success message
    notifying the user that the transaction has been made. It
    also informs the user that they can return to the main menu
    simply by typing 0 and pressing Enter.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_deposit(amount, option) do
    account = case option  do
      1 -> "Checking"
      2 -> "Savings"
    end

    IO.puts "********* Elixir Banking ************\n"
    IO.puts " You have successfully deposited $#{amount}"
    IO.puts " into your #{account} account!"
    IO.puts " Enter 0 to continue..."
    IO.puts "\n*************************************"
  end

  def draw_withdraw(amount, option) when amount == -1 and option == -1 do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " 1 - Checking "
    IO.puts " 2 - Savings "
    IO.puts " 0 - Go Back "
    IO.puts "\n*************************************"
  end

  def draw_withdraw(amount, _option) when amount == -1 do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts " How much would you like to withdraw?"
    IO.puts " Enter 0 to go back..."
    IO.puts "\n*************************************"
  end

  @doc """
    When the user first chooses to make a withdrawal from one of their
    accounts (in other words, when they have not yet chosen an account
    or amount to withdraw), prints a prompt to choose an account for
    which to make the withdrawal onto the screen, allowing the user to
    make a decision.

    When the user chooses an amount from which to make the withdrawal,
    prints a prompt to the screen asking them for the dollar amount
    they would like to withdraw. In the real world, the user would
    do this either from an ATM or the bank themselves and they would
    receive their requested amount in cash. However, this is a mockup,
    so unfortunately it does not quite work like that. :(

    When the user chooses an amount to withdraw and an account
    to withdraw the amount from, prints a success message
    notifying the user that the transaction has been made (assuming
    the user has chosen an amount that is below or equal to the
    amount that they have stored into their account). It
    also informs the user that they can return to the main menu
    simply by typing 0 and pressing Enter.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_withdraw(amount, option) do
    account = case option  do
      1 -> "Checking"
      2 -> "Savings"
    end

    IO.puts "********* Elixir Banking ************\n"
    IO.puts " You have successfully withdrew $#{amount}"
    IO.puts " from your #{account} account!"
    IO.puts " Enter 0 to continue..."
    IO.puts "\n*************************************"
  end

  @doc """
    Draws the application information to the screen
    for easy access.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_about_info do
    IO.puts "\nCopyright 2024 All Rights Reserved"
    IO.puts "This app was created by Dominick Wiley"
    IO.puts "in order to learn the Elixir"
    IO.puts "programming language. \n"
    IO.puts "Enter 0 to go back... "
  end

  @doc """
    Prints a closing message to be displayed to the user
    before the application inevitably closes.
    Return `:ok`
  """
  @doc since: "1.0.0"
  def draw_closing_screen do
    IO.puts "Thank you for choosing Elixir Banking!"
    IO.puts "Have a nice day!"
  end

  @doc """
    Prints error information to the screen, notifying the
    user that something has gone awry. Details about this
    error are also displayed for easy access. The user is
    also notified that they can return to the main menu
    simply by typing 0 and pressing Enter.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def draw_error_screen(message \\ "Something went wrong!") do
    IO.puts "********* Elixir Banking ************\n"
    IO.puts "              Oops!"
    IO.puts " #{message}"
    IO.puts " Please try again later!"
    IO.puts " Enter 0 to go back..."
    IO.puts "\n*************************************"
  end
end
