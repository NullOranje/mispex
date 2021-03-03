defmodule MISP.Sighting do
  @moduledoc """
  A sighting is an observation of an attribute
  """

  alias MISP.{
    HTTP,
    Sighting
  }

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field :id, String.t()
    field :uuid, String.t()
    field :source, String.t()
    field :attribute_id, String.t()
    field :event_id, String.t()
    field :org_id, String.t()
    field :date_sighting, String.t()
    field :value, String.t()
    field :values, list(String.t())
    field :timestamp, non_neg_integer()
    field :date, String.t()
    field :time, String.t()
  end

  use Accessible

  def decoder do
    %MISP.Sighting{}
  end

  @doc """
  Add a new sighting.  Requires either a list of values or an id (can be UUID)

      iex> {:ok, my_sighting} = MISP.Tag.create(%MISP.Sighting{id: "1234"})
  """
  def create(%Sighting{} = sighting) do
    case HTTP.post("/sightings/add", sighting, %{"Sighting" => decoder()}) do
      {:ok, resp} -> {:ok, Map.get(resp, "Sighting")}
      {:error, reason} -> {:error, reason}
    end
  end
end
