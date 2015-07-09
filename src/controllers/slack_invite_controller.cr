require "amethyst/all"

class SlackInviteController < Controller
  actions :index, :invite

  view "index", "#{__DIR__}/../views"
  def index
    render "index"
  end

  def invite
    email = request.request_parameters["email"]
    result = { :ok => true }

    begin
      Slack.invite(email)
    rescue e
      result = {
        :ok => false,
        :error => e.message,
      }
    end

    json result.to_json
  end
end

