# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    field :sender, String, null: false
    field :message, String, null: false
  end
end
