App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #step 4: add event listener
    #listen from id="messages in views/show.html.erb"
    $('#messages').append data['message']
    #passed class="content" in _message.html.erb
    $('#message_content').val ''
    scrollToBottom()
    return
    
    jQuery(document).on 'turbolinks:load', ->
      scrollToBottom()
      return
      
      # Called when there's incoming data on the websocket for this channel