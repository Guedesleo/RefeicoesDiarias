defmodule ExMeal.Meals.Get do
  alias ExMeal.Repo
  alias ExMeal.Meals.Meal
  alias ExMeal.Error
  def by_id(meal_id) do
    case Repo.get(Meal, meal_id) do
      %Meal{} = meal -> {:ok, meal}
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end
end
