require "kemal"

require "./services/*"
require "./controllers/*"

# class App < Base::App
#   routes.draw do
#     all "/", "slack_invite#index"
#     all "/en/", "slack_invite#index"
#     post "/invite", "slack_invite#invite"
#     register SlackInviteController
#   end
#
#   settings.configure do |conf|
#     #conf.environment = "development"
#     conf.static_dirs = ["/assets"]
#   end
# end

slack_invite = SlackInviteController.new

get "/" { |env| slack_invite.index(env) }
get "/en/" { |env| slack_invite.index(env) }
post "/invite" { |env| slack_invite.invite(env) }
