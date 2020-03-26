class MessagesController < ApplicationController
   before_action :authenticate_user!, :only => [:create]

   def create
     if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
       @message = Message.new(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
       @message.current_user.id = current_user.id
       @message.save
       pp @message
       redirect_to "/rooms/#{@message.room_id}"
     else
       redirect_back(fallback_location: root_path)
     end
   end
end
