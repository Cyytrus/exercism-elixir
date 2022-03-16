defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    Integer.floor_div(score - 10, 2)
  end

  @spec ability :: pos_integer()
  def ability do
    1..4
    |> Enum.map(fn _ -> roll_dice_6() end)
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    character = %__MODULE__{
      strength: ability(),
      dexterity: ability(),
      hitpoints: ability(),
      constitution: ability(),
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability()
    }

    %{character | hitpoints: 10 + modifier(character.constitution)}
  end

  defp roll_dice_6 do
    :rand.uniform(6)
  end
end
