defmodule Crawler do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://www.codegram.com"

  @impl Crawly.Spider
  def init(), do: [start_urls: ["https://www.codegram.com/blog"]] # urls that are going to be parsed

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    items =
      document
      |> Floki.find("h5.card-content__title") # query h5 elements with class card-content__title
      |> Enum.map(&Floki.text/1)
      |> Enum.map(fn title -> %{title: title} end)

    %Crawly.ParsedItem{items: items, requests: []}
  end
end
