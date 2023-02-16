require 'stream-chat'
require 'byebug'

# Handle connection with GetStream
class GetStreamConnect

  # @param stream_key [String]
  # @param stream_secret [String]
  # @return [self]
  def initialize(stream_key, stream_secret)
    raise ArgumentError, "Stream key or Stream Secret invalid" if stream_key.nil? || stream_secret.nil?

    @client = StreamChat::Client.new(stream_key, stream_secret)
  end

  # @return [void]
  def create_user(username:, name:, role: 'admin')
    user = {
      id: username,
      role: role,
      name: name
    }

    new_user = client.upsert_user(user)
    new_user
  end

  # @return [void]
  def create_channel(members:, slug:)
    return if slug.nil? || members.empty?

    # Create a channel with members from the start
    new_channel = client.channel("messaging", channel_id: slug, data: { :members => members })
    new_channel.create(members[0])

    new_channel
  end

  # @return [void]
  def create_channel_type
    channel = {
      name: 'livechat',
      automod: 'disabled',
      commands: ['ban'],
      mutes: true
    }

    new_channel_type = client.create_channel_type(channel)
    new_channel_type
  end

  # @return [void]
  def retrieve_channel_types
    channel_types = client.list_channel_types
    channel_types
  end

  attr_accessor :client
end