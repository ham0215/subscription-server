# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'subscribed'
  end

  def unsubscribed
  end

  def chat(data)
    ChatChannel.broadcast_to('message', data);
  end
end
