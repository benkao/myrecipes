class ChatroomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chatroom_channel" #step 1: add channel, next step update form submisson at chatrooms/show.html.erb to take advantage of Ajax
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
