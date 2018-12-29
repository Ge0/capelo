defmodule Capelo.CLI do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "Please provide a filename."
  end

  def process(args) do
    [filename | _] = args
    content = File.read! filename
    IO.puts content
    IO.inspect Capelo.FrenchLexer.lex(content)
  end

  defp parse_args(args) do
    {_, argv, _} = OptionParser.parse(args,
      switches: [name: :string]
    )
    argv
  end
end
