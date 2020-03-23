class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  attr_accessor :current_user
  after_create_commit { MessageBroadcastJob.perform_later self, current_user }
end
