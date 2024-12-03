defmodule UserTest do
  def read() do
    # Mock user inputs
    mock_input_1 = "1"
    mock_input_2 = "2"
    mock_input_3 = "Yes"
    mock_input_4 = ":ok"

    # Mock input validation
    test_status = is_integer(mock_input_1)
    test_status = is_integer(mock_input_2)
    test_status = !is_integer(mock_input_3)
    test_status = !is_integer(mock_input_4)
  rescue
    RuntimeError -> :error
  end

  def test() do
    read_test = case UserTest.read() do
      true -> "PASS"
      false -> "FAIL"
      :error -> "ERROR"
    end

    IO.puts "Read Input Test: #{read_test}"
  end
end

UserTest.test()
