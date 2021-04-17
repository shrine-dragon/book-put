$( () => {
  // プルダウンメニューの表示と非表示の設定
  $('#user-image').click( () => {
    $('#pull-down').toggle();
  } );
  // 本人画像以外の要素をクリックした時のイベントの設定
  $(document).click( (e) => {
    if(!$(e.target).closest('#user-image').length) {
      $('#pull-down').removeAttr('style');
    }
  } )
} );