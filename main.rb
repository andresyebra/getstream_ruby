require_relative 'lib/getstream_connect.rb'

STREAM_APP = "APP"
STREAM_KEY = "KEY"
STREAM_SECRET = "SECRET"

stream = GetStreamConnect.new(STREAM_KEY, STREAM_SECRET)

puts stream.create_user(username: "fan0xd9A9a", name: "Andres")
puts stream.create_channel(members: ["fan0xd9A9a"], slug: "Awaken")
puts stream.generate_user_token(username: "fan0xd9A9a")


