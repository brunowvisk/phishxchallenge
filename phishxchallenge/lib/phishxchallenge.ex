defmodule Phishxchallenge do
  @moduledoc """
  Phishxchallenge keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Phishxchallenge.AvIndex
  alias Phishxchallenge.PhishxIndex.Create
  alias Phishxchallenge.PhishxIndex.Get

  defdelegate fetch_companyoverview(params), to: AvIndex.Get, as: :call
  defdelegate create_phishx_companyoverview(params), to: Create, as: :call
  defdelegate get_all_overviews(), to: Get, as: :all_overviews


end
