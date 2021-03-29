const pullDown = () => {
  const pullDownButton = document.getElementById("user-image");
  const pullDownParents = document.getElementById("pull-down");
  pullDownButton.addEventListener('click', () => {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
    }
  });
}

window.addEventListener('DOMContentLoaded', pullDown);