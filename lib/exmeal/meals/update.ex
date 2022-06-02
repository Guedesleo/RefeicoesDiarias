defmodule ExMeal.Meals.Update do

  alias ExMeal.Meals.Meal
  alias ExMeal.{Error, Repo}
  def call(meal_id, %{} = params) do
    with {:ok, %Meal{} = meal} <- ExMeal.get_meal_by_id(meal_id) do
      do_update(meal, params)
    end
  end

  defp do_update(%Meal{} = meal, %{} = params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Meal{}} = result), do: result

  defp handle_update({:error, %Ecto.Changeset{} = changeset}) do
    {:error, Error.build(changeset, :bad_request)}
  end
end
