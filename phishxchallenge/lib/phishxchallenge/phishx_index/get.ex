defmodule Phishxchallenge.PhishxIndex.Get do
  @moduledoc """
    This module aims to get all companies overview inserted in the Postgres Database.
  """

  alias Phishxchallenge.Repo
  alias Phishxchallenge.CompanyOverview

  @doc """
    all_overviews method is responsable to get all data from database.
  """
  def all_overviews do
    Repo.all(CompanyOverview)
  end

end
