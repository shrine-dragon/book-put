// コメントフォームにフォーカスを当てた（クリックした）時のイベントの設定
$(() => {
  $('.comment-form-text').focus( () => {
    $('.comment-yellow-btn').css('display', 'block');
  })
  
  // コメントフォームからフォーカスが外れた（他の要素をクリックした）時のイベントの設定
  $(document).click((e) => {
    if(!$(e.target).closest('#comment').length) {
      $('.comment-yellow-btn').css('display', '');
    }
  });

  // コメントフォームに文字を入力した時のイベントの設定
  $('.comment-form-text').on('input', () => {
    $('.comment-yellow-btn').css({
      'display': 'block',
      'color': 'black',
      'background-color': '#FF0',
      'cursor': 'pointer'
    });

    // コメント送信ボタンにカーソルを合わせた時と外した時のイベントの設定
    $('.comment-yellow-btn').mouseover(() => {
      $('.comment-yellow-btn').css('background-color', '#FFFFAA');
    }).mouseout(() => {
      $('.comment-yellow-btn').css('background-color', '#FF0');
    });
  });
});