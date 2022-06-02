defmodule ExMeal.Meals.Delete do

  alias ExMeal.Meals.Meal
  alias ExMeal.{Error, Repo}
  def call(meal_id) do
    with {:ok, %Meal{} = meal} <- ExMeal.get_meal_by_id(meal_id) do
      case Repo.delete(meal) do
        {:ok, _struct} = result -> result
        {:error, changeset} -> {:error, Error.build(changeset, :bad_request)}
      end
    end
  end
end
