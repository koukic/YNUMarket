class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message, message.current_user)
  end

  private
    def render_message(message, current_user)
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message, current_user: current_user }
    end
end
