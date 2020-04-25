class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params['room']}"
    # stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    unless data['message'].blank?
      Message.create! content: data['message'], user_id: current_user.id, room_id: params['room'], current_user: current_user
       # ActionCable.server.broadcast 'room_channel', message: data['message']
    end
  end
end
