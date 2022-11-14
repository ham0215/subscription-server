# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :message_was_posted, subscription: Subscriptions::MessageWasPosted
  end
end
