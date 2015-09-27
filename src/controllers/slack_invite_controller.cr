require "yaml"

require "amethyst/all"

class SlackInviteController < Controller
  actions :index, :invite

  def initialize
    super

    @langs = {
      :ja => YAML.load(File.read("config/ja.yml")) as Hash,
      :en => YAML.load(File.read("config/en.yml")) as Hash,
    }

    @texts = {} of String => String
  end

  view "index", "#{__DIR__}/../views/"
  def index
    lang = /en\/?$/ === request.path ? :en : :ja

    @texts = @langs[lang]
    @lang = @team = lang.to_s

    html render("index")
  end

  def invite
    email = request.request_parameters["email"]
    team  = request.request_parameters["team"]
    result = { :ok => true }

    begin
      Slack.invite(email, team)
    rescue e
      result = {
        :ok => false,
        :error => e.message,
      }
    end

    json result.to_json
  end
end

