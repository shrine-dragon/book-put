$(() => {
  // プルダウンメニューの表示と非表示の設定
  $('#user-image').click(() => {
    $('#pull-down').toggle();
  });
  // 本人画像以外の要素をクリックした時のイベントの設定
  $(document).click((e) => {
    if(!$(e.target).closest('#user-image').length) {
      $('#pull-down').removeAttr('style');
    }
  });
  // プルダウンメニューの表示と非表示の設定
  $('#ellipsis-btn').click(() => {
    $('#pull-down-2').toggle();
  });
  // 省略記号以外の要素をクリックした時のイベントの設定
  $(document).click((e) => {
    if(!$(e.target).closest('#ellipsis-btn').length) {
      $('#pull-down-2').removeAttr('style');
    }
  });
});