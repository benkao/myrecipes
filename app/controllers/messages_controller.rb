class MessagesController < ApplicationController
  before_action :require_user #to make sure current_chef is available
  
  def create
    @message = Message.new(message_params)
    @message.chef = current_chef
    if @message.save
      #step 3: replace chat_path with broadcast, next step: add event listener in javascripts/chatroom.coffee
      #redirect_to chat_path
      ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message), #different technique used in comments_controller
                                                        chef: @message.chef.chefname
    else                                               
      render 'chatrooms/show'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:content)
  end
  
  def render_message(message)
    render(partial: 'message', locals: {message: message}) #locals: so that can access message object in message partial
  end
  
end