require "amethyst"
require "./services/*"
require "./controllers/*"

class App < Base::App
  routes.draw do
    all "/", "slack_invite#index"
    post "/invite", "slack_invite#invite"
    register SlackInviteController
  end

  settings.configure do |conf|
    #conf.environment = "development"
    conf.static_dirs = ["/assets"]
  end
end

app = App.new

if ENV.has_key? "PORT"
  app.serve(ENV["PORT"].to_i)
else
  app.serve
end
