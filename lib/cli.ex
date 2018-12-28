defmodule Capelo.CLI do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "Please provide a filename."
  end

  def process(args) do
    [filename | _] = args
    IO.puts filename
  end

  defp parse_args(args) do
    {_, argv, _} = OptionParser.parse(args,
      switches: [name: :string]
    )
    argv
  end
end
