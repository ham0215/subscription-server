# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug("subscribed: #{current_user.id}")
    stream_from 'chat'
  end

  def unsubscribed
    Rails.logger.debug("unsubscribed: #{current_user.id}")
  end

  def received(data)
    Rails.logger.debug("user: #{current_user.id}, message: #{data}")
    # ChatChannel.broadcast_to('chat', { body: "sent: #{current_user.id}" })
    ActionCable.server.broadcast('chat', { body: "sent: #{current_user.id}" })
  end
end
