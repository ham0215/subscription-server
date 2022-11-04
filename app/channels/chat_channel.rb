# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug("subscribed")
    stream_from 'subscribed'
  end

  def unsubscribed
    Rails.logger.debug("unsubscribed")
  end

  def received(data)
    Rails.logger.debug("message: #{data}")
    ChatChannel.broadcast_to('message', data)
  end
end
