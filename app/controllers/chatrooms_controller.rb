class ChatroomsController < ApplicationController
 before_action :require_user #so that when typing "".../chat" won't work without log in
  def show  
    @message = Message.new
    #@messages = Message.all
    @messages = Message.most_recent
  end

end