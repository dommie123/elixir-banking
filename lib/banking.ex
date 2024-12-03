defmodule Banking do
  @moduledoc """
  This is the main module for the Banking app. It handles many traditional
  banking functions and updates the GUI with new information from either
  the user or the main bank account structure.
  """
  @moduledoc since: "1.0.0"

  # Import the following modules
  require OverdraftError
  require GUI
  require UserInput

  # Defstruct is how I can define a module's "fields" like in Java or C++.
  defstruct [:checking, :savings]

  @doc """
    Returns the user to the main menu. Once here, they are prompted to
    choose one of many options, including viewing their account balance,
    performing basic banking tasks, viewing app information, or exiting
    the program.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def main_menu(account_info \\ %Banking{checking: 50.00, savings: 125.00}) do
    GUI.draw_welcome_screen()
    option = UserInput.read()

    case option do
      1 -> view_balance(account_info)
      2 -> deposit(account_info)
      3 -> withdraw(account_info)
      4 -> view_app_info(account_info)
      0 -> exit_app()
    end
  end

  @doc """
    Retrieves the user's account information and writes it to the console
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def view_balance(account_info) do
    GUI.draw_account_balance(account_info.checking, account_info.savings)
    UserInput.read()
    main_menu(account_info)
  end

  @doc """
    This performs one of four actions depending on the arguments given.
    1 - Prompts the user to choose an account to deposit the money into
    2 - Prompts the user to choose an amount they would like to deposit
    3 - Displays a success message when they are finished making the deposit
    4 - Returns to the main menu. Note that the user may choose to do this
    at any point during the deposit phase, and doing this early will not
    affect their bank account whatsoever.

    Returns `:ok`
  """
  @doc since: "1.0.0"
  def deposit(account_info, amount \\ -1, option \\ -1) do
    # Update account information if a valid amount has been retrieved
    account_info = %{
      checking: if amount > -1 and option == 1 do
        account_info.checking + amount
      else
        account_info.checking
      end,
      savings:  if amount > -1 and option == 2 do
        account_info.savings + amount
      else
        account_info.savings
      end
    }

    # Draw deposit information onto the screen
    GUI.draw_deposit(amount, option)

    # Determine which step of deposit process the user is in by matching the current amount and option values.
    input = case [amount, option] do
      [^amount, -1] -> UserInput.read()
      [^amount, 0] -> UserInput.read()
      [-1, 1] -> UserInput.read_float()
      [-1, 2] -> UserInput.read_float()
      [^amount, 1] -> UserInput.read()
      [^amount, 2] -> UserInput.read()
    end

    # Set the amount if the input is a float.
    amount = if is_float(input) and option > 0 and amount == -1 do
      input
    else
      amount
    end

    # Set the option if it has not already been set
    option = if is_integer(input) and option == -1 do
      input
    else
      option
    end

    # Repeat this logic or return to the main menu if the input is 0.
    if input == 0 do
      main_menu(account_info)
    else
      deposit(account_info, amount, option)
    end

  end

  @doc """
    This performs one of five actions depending on the arguments given.
    1 - Prompts the user to choose an account from which to make the withdrawal
    2 - Prompts the user to choose an amount they would like to withdraw
    3 - Displays a success message when they are finished making the withdrawal
    4 - Raises an error when the user tries to withdraw more money than they have
    in that account.
    5 - Returns to the main menu. Note that the user may choose to do this
    at any point during the withdrawal phase, and doing this early will not
    affect their bank account whatsoever.

    Returns `:ok`
  """
  @doc since: "1.0.0"
  def withdraw(account_info, amount \\ -1, option \\ -1) do
    # Check to see if the user can take that amount out of their account. If not, raise an error.
    updated_checking = if amount > -1 and option == 1 do
      account_info.checking - amount
    else
      account_info.checking
    end
    updated_savings = if amount > -1 and option == 2 do
      account_info.savings - amount
    else
      account_info.savings
    end

    if updated_checking < 0 or updated_savings < 0 do
      raise OverdraftError
    end

    # Update account information if a valid amount has been retrieved
    account_info = %{checking: updated_checking, savings: updated_savings}

    # Draw withdrawal information to the screen
    GUI.draw_withdraw(amount, option)

    # Determine which step of withdrawal process the user is in by matching the current amount and option values.
    input = case [amount, option] do
      [^amount, -1] -> UserInput.read()
      [^amount, 0] -> UserInput.read()
      [-1, 1] -> UserInput.read_float()
      [-1, 2] -> UserInput.read_float()
      [^amount, 1] -> UserInput.read()
      [^amount, 2] -> UserInput.read()
    end

    # Set the amount if the input is a float.
    amount = if is_float(input) and option > 0 and amount == -1 do
      input
    else
      amount
    end

    # Set the option if it has not already been set
    option = if is_integer(input) and option == -1 do
      input
    else
      option
    end

    # Repeat this logic or return to the main menu if the input is 0.
    if input == 0 do
      main_menu(account_info)
    else
      withdraw(account_info, amount, option)
    end
  rescue
    e in OverdraftError -> show_error(account_info, e.message)
  end

  @doc """
    Presents the app information to the user and allows them to return
    to the main menu when they are finished.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def view_app_info(account_info) do
    GUI.draw_about_info()
    UserInput.read()
    main_menu(account_info)
  end

  @doc """
    Exits the application.
    Returns `:ok`
  """
  @doc since: "1.0.0"
  def exit_app do
    GUI.draw_closing_screen()
    exit(:shutdown)
  end

  defp show_error(account_info, message) do
    GUI.draw_error_screen(message)
    UserInput.read()
    main_menu(account_info)
  end

end
