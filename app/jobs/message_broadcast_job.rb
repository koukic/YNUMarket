class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, operated_user)
    pp operated_user
    ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message, operated_user)
  end

  private
  def render_message(message, operated_user)
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: message, operated_user: operated_user }
  end
end
