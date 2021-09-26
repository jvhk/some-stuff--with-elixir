alias ProjectApi.Repo
alias ProjectApi.Management.Project

Repo.insert! %Project{
  title: "Super Cool PING",
  descritpion: "PONG!"
}
