defmodule ExMeal.Meals.Create do

  alias ExMeal.{Error, Repo}
  alias ExMeal.Meals.Meal

  @type params :: %{
          user_id: Ecto.UUID,
          calories: String.t(),
          date: Calendar.naive_datetime(),
          description: String.t()
        }

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}) do
    {:error, Error.build(changeset, :bad_request)}
  end
end
