defmodule TryingEcto do
  def start(_type, _args) do
    children =[
      Friends.Repo
    ]
  end
end
