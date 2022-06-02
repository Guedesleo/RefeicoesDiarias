defmodule Exmeal.Error do
  @enforce_keys [:result, :status]

  defstruct [:result, :status]

  def build(result, status) do
    %__MODULE__{
      result: result,
      status: status
    }
  end

  @spec build_meal_not_found_error :: %__MODULE__{result: String.t(), status: :not_found}
  def build_meal_not_found_error, do: build("Meal not found!", :not_found)

  @spec build_user_not_found_error :: %__MODULE__{result: String.t(), status: :not_found}
  def build_user_not_found_error, do: build("User not found!", :not_found)
end
