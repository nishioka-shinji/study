require 'line/bot'
require "./config/initializers/constants"

message = {
  type: 'text',
  text: "#{i}回目の送信"
}
client = Line::Bot::Client.new { |config|
    config.channel_secret = CONST::LINE_CONFIG[:CHANNEL_SECRET]
    config.channel_token  = CONST::LINE_CONFIG[:CHANNEL_TOKEN]
}
response = client.push_message(CONST::LINE_CONFIG[:USER_ID], message)