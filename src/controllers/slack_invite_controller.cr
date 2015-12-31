require "yaml"

class SlackInviteController
  def initialize
    @langs = {
      :ja => YAML.load(File.read("config/ja.yml")) as Hash,
      :en => YAML.load(File.read("config/en.yml")) as Hash,
    }

    @texts = {} of String => String
  end

  def index(env)
    lang  = /en\/?$/ === env.request.path ? :en : :ja
    texts = @langs[lang]
    team  = lang.to_s

    render "views/index.ecr"
  end

  def invite(env)
    email = env.params["email"]
    team  = env.params["team"]
    result = { :ok => true }

    begin
      if email.is_a? String && team.is_a? String
        Slack.invite(email, team)
      else
        raise "request parameter error"
      end
    rescue e
      result = {
        :ok => false,
        :error => e.message,
      }
    end

    result.to_json
  end
end

