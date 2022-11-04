# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug("subscribed: #{current_user.id}")
    stream_from 'chat'
  end

  def unsubscribed
    Rails.logger.debug("unsubscribed: #{current_user.id}")
  end

  def chat(data)
    Rails.logger.debug("user: #{current_user.id}, message: #{data}")
    ActionCable.server.broadcast('chat', { sender: current_user.name, body: data['body'] })
  end
end
