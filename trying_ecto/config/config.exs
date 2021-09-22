import Config

config :trying_ecto, Friends.Repo,
  database: "trying_ecto_repo",
  username: "postgres",
  password: "root",
  hostname: "localhost"

config :trying_ecto, ecto_repos: [Friends.Repo]
