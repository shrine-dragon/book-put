$(() => {
  $('.faq-list-item').click(function() {
    let $answer = $(this).find('.answer');
    $answer.slideToggle();
    let $symbol = $(this).find('span');
    $symbol.text('-');
  })
});