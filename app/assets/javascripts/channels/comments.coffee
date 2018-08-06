App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) -> 
    $("#messages .comment-fix:first").prepend(data)
    # add comment-fix from _comments.html.erb
    #add .comment-fix:first to make recipe comments stay within paginates 
