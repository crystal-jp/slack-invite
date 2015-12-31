require "kemal"

require "./services/*"
require "./controllers/*"

slack_invite = SlackInviteController.new

get "/" { |env| slack_invite.index(env) }
get "/en/" { |env| slack_invite.index(env) }
post "/invite" { |env| slack_invite.invite(env) }
