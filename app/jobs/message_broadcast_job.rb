class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{direct_message.room_id}", direct_message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
    end
end