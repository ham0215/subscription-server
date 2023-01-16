# frozen_string_literal: true

module Subscriptions
  class MessageWasPosted < Subscriptions::BaseSubscription
    argument :message, String, required: true
    type Types::MessageType, null: false

    def subscribe(message:); end

    def update(message:)
      {
        sender: current_user.name,
        message:
      }
    end
  end
end
