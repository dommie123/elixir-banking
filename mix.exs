defmodule MyProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_banking, # The name of your project
      version: "1.0.0", # Project version
      elixir: "~> 1.17.3", # Minimum Elixir version
      start_permanent: Mix.env() == :prod, # Set production settings
      deps: deps() # Call the deps function to list dependencies
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      extra_applications: [:logger] # Additional applications to start
    ]
  end

  # List of dependencies
  defp deps do
    [
    ]
  end
end
