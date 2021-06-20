// flashメッセージを2秒後に消去
$(()=> {
  setTimeout("$('#flash-message').fadeOut('slow')", 2000);
});