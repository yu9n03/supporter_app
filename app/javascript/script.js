$(function() {
  $('#chat-modal').click(function(){
    $('#show-chat-modal').fadeIn();
  });
  $('#close-modal').click(function(){
    $('#show-chat-modal').fadeOut();
  });


  $('.reservation-top-logo').on('click', function () {
    $(this).next().slideToggle();
  });
});