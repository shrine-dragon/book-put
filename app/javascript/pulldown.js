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
  // プルダウンメニューの表示と非表示の設定（要素が一つの場合）
  $('#ellipsis-btn').click(() => {
    $('#pull-down-2').toggle();
  });
  // 省略記号ボタン以外の要素をクリックした時のイベントの設定（複数の要素の場合）
  $(document).click((e) => {
    if(!$(e.target).closest('#ellipsis-btn').length) {
      $('#pull-down-2').removeAttr('style');
    }
  });
  // プルダウンメニューの表示と非表示の設定（複数の要素の場合）
  const pullDownBtn = document.querySelectorAll('#ellipsis-btn-2');
  const pullDownMenu = document.querySelectorAll('#pull-down-3');
  for ( let i = 0; i < pullDownBtn.length; i++) {
    pullDownBtn[i].addEventListener("click", () => {
      if (pullDownMenu[i].getAttribute("style") == "display: block;") {
        pullDownMenu[i].removeAttribute("style", "display: block;");
      } else {
        pullDownMenu[i].setAttribute("style", "display: block;");
      }
    });
    // 省略記号ボタン以外の要素をクリックした時のイベントの設定（複数の要素の場合）
    document.addEventListener('click', (e) => {
      if(!e.target.closest('#ellipsis-btn-2')) {
        pullDownMenu[i].removeAttribute("style", "display:block;");
      }
    });
  }
});