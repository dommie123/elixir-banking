defmodule BankingApp do
  require Banking

  def run() do
    Banking.main_menu()
  end
end

BankingApp.run()
