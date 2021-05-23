$(() => {
  // 本人画像をクリックした時のプルダウンイベントの設定
  $('#user-image').click(() => {
    $('#pull-down-singular').toggle();
  });

  // 本人画像以外の要素をクリックした時のプルダウンイベントの設定
  $(document).click((e) => {
    if(!$(e.target).closest('#user-image').length) {
      $('#pull-down-singular').removeAttr('style');
    }
  });

  // 省略記号ボタンをクリックした時のプルダウンイベントの設定（一つの要素の場合）
  $('#ellipsis-btn').click(() => {
    $('#pull-down-singular-2').toggle();
  });

  // 省略記号ボタン以外の要素をクリックした時のプルダウンイベントの設定（一つの要素の場合）
  $(document).click((e) => {
    if(!$(e.target).closest('#ellipsis-btn').length) {
      $('#pull-down-singular-2').removeAttr('style');
    }
  });
  
  // 省略記号ボタンをクリックした時のプルダウンイベントの設定（複数の要素の場合）
  const pullDownBtn = document.querySelectorAll('#ellipsis-btn-2');
  const pullDownMenu = document.querySelectorAll('#pull-down-multiple');
  for ( let i = 0; i < pullDownBtn.length; i++) {
    pullDownBtn[i].addEventListener("click", () => {
      if (pullDownMenu[i].getAttribute("style") == "display: block;") {
        pullDownMenu[i].removeAttribute("style", "display: block;");
      } else {
        pullDownMenu[i].setAttribute("style", "display: block;");
      }
    });

    // 省略記号ボタン以外の要素をクリックした時のプルダウンイベントの設定（複数の要素の場合）
    document.addEventListener('click', (e) => {
      if(!e.target.closest('#ellipsis-btn-2')) {
        pullDownMenu[i].removeAttribute("style", "display:block;");
      }
    });
  }
});