use Mix.Config

config :crawly,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    Crawly.Middlewares.RobotsTxt
  ],
  pipelines: [
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, folder: "/tmp", extension: "csv"}
  ]
