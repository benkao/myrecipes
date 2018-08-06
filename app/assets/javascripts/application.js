// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


//event listner for data behavior / send from chatrooms/show.html.erb under views
$(document).on('keypress','[data-behavior~=room_speaker]',function(veent){
  if (event.keyCode == 13){ //enter key
    submitMmessage(event);
  }
});

$(document).on('click','[data-send~=message]',function(veent){
    submitMmessage(event);
});

function submitMmessage(event) {
  event.preventDefault();
  $('#new_message').submit();
}

$(document).ready(function(){  //when page loads, calling scrollToBottom function
  $("#new_message").on("ajax:complete", function(e, data, status) {
    $('#message_content').val('');
  })
  scrollToBottom();
});

function scrollToBottom(){
  if($('#messages').length > 0 ) {  // grap event listener id="messages" in chatrooms/show.html.erb
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}