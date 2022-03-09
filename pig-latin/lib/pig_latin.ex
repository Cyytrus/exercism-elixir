defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @vowels 'aeiou'
  @sound_vowels 'yx'
  @exceptions ['qu']

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&convert/1)
    |> Enum.join(" ")
  end

  defp convert(word = [first | [second | _]])
    when first in @vowels
    when first in @sound_vowels and second not in @vowels do
    word ++ 'ay'
  end

  defp convert([first | [second | rest]]) when [first, second] in @exceptions, do: convert(rest ++ [first, second])

  defp convert([first | rest]), do: convert(rest ++ [first])
end
