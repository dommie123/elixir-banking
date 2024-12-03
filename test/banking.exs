# Define unit test here
defmodule BankingTest do
  def view_balance() do
    balance = 125.00

    Banking.view_balance()

  rescue
    RuntimeError -> :error
    UndefinedFunctionError -> :unimplemented
  end

  def deposit() do
    balance = 125.00

    Banking.deposit(10)

    balance == 135.00
  rescue
    RuntimeError -> :error
    UndefinedFunctionError -> :unimplemented
  end

  def withdraw() do
    balance = 125.00

    Banking.withdraw(10)

    balance == 115.00
  rescue
    RuntimeError -> :error
    UndefinedFunctionError -> :unimplemented
  end

  # Test the code here
  def test() do
    deposit_test = case BankingTest.deposit() do
      true -> "PASS"
      false -> "FAIL"
      :error -> "EXCEPTION"
      :unimplemented -> "NOT YET IMPLEMENTED"
    end

    withdraw_test = case BankingTest.withdraw() do
      true -> "PASS"
      false -> "FAIL"
      :error -> "EXCEPTION"
      :unimplemented -> "NOT YET IMPLEMENTED"
    end

    view_balance_test = case BankingTest.view_balance() do
      true -> "PASS"
      false -> "FAIL"
      :error -> "EXCEPTION"
      :unimplemented -> "NOT YET IMPLEMENTED"
    end

    IO.puts "Deposit Test: #{deposit_test}"
    IO.puts "Withdraw Test: #{withdraw_test}"
    IO.puts "View Balance Test: #{view_balance_test}"
  end
end

# Run unit test
BankingTest.test()
