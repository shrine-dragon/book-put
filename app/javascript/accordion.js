$(() => {
  $('.faq-list-item').click(function() {
    let $answer = $(this).find('.answer');
    $answer.slideToggle();
    if($answer.attr('style')) {
      let $symbol = $(this).find('span');
      $symbol.text('-');
    } else {
      $symbol.text('+');
    }
  })
});