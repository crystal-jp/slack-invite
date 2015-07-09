module Slack
  def self.invite(email)
    team = ENV["SLACK_TEAM"]
    token = ENV["SLACK_TOKEN"]

    url = "https://#{team}.slack.com/api/users.admin.invite"
    form = {
      "email" => email,
      "token" => token,
      "set_active" => "true",
    }

    res = HTTP::Client.post_form(url, form)

    raise "http_error" unless res.status_code == 200
    raise "bad_response" unless res.headers["Content-Type"].starts_with? "application/json"

    body = JSON.parse(res.body) as Hash(String, JSON::Type)
    raise body["error"].to_s unless body["ok"] as Bool
  end
end

