$(() => {
  $('.comment-field-text').click( () => {
    $('.comment-yellow-btn').css('display', 'block');
  });

  $(document).click((e) => {
    if(!$(e.target).closest('#comment').length) {
      $('.comment-yellow-btn').css('display', '');
    }
  });

  $('.comment-field-text').on('input', () => {
    $('.comment-yellow-btn').css({
      'display': 'block',
      'color': 'black',
      'background-color': 'yellow',
      'cursor': 'pointer'
    });
    $('.comment-yellow-btn').mouseover(() => {
      $('.comment-yellow-btn').css('background-color', '#FFFFAA');
    }).mouseout(() => {
      $('.comment-yellow-btn').css('background-color', 'yellow');
    });
  });
});