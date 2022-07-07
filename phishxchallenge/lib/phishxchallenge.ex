defmodule Phishxchallenge do
  @moduledoc """
  Phishxchallenge keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Phishxchallenge.AvIndex
  alias Phishxchallenge.PhishxIndex

  defdelegate fetch_companyoverview(params), to: AvIndex.Get, as: :call
  defdelegate create_phishx_companyoverview(params), to: PhishxIndex.Create, as: :call


end
