use Mix.Config

config :crawly,
  closespider_timeout: 10,
  concurrent_requests_per_domain: 8,
  pipelines: [
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "jl", folder: "/tmp"}
  ]
