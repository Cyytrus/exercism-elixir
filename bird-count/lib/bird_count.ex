defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [hd(list) + 1 | tl(list)]

  def has_day_without_birds?(list), do: 0 in list

  def total([]), do: 0
  def total(list), do: Enum.sum(list)

  def busy_days(list), do: Enum.count(list, &(&1 >= 5))
end
