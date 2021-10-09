// $(() => {
//   $('.faq-list-item').click(function() {
//     let $answer = $(this).find('.answer');
//     if($answer.hasClass('open')) { 
//       $answer.removeClass('open');
//       // slideUpメソッドを用いて、$answerを隠してください
//       $answer.slideUp();

//       // 子要素のspanタグの中身をtextメソッドを用いて書き換えてください
//       $(this).find('.plus');
//       $('.plus').text('+');
//     } else {
//       $answer.addClass('open'); 
//       // slideDownメソッドを用いて、$answerを表示してください
//       $answer.slideDown();
      
//       // 子要素のspanタグの中身をtextメソッドを用いて書き換えてください
//       $(this).find('.plus');
//       $('.plus').text('-');
//     }
//   })
// });

$(() => {
  const faqListItem = document.querySelectorAll('.faq-list-item');
  const plus = document.querySelectorAll('.plus');
  for(let i = 0; i < 3; i++) {
    faqListItem[i].addEventListener("click", () => {
      let $answer = $(faqListItem[i]).find('.answer');
      $answer.slideToggle();
      if(faqListItem[i].classList.contains('open')) {
        plus[i].textContent = "-"; 
        console.log(plus[i].textContent);
      } else {
        console.log(plus[i].textContent);
      }
    })
  }
})