$(document).ready(function(){
  $('.topic-area').slick({
  	 // アクセシビリティ。左右ボタンで画像の切り替えをできるかどうか
 	accessibility: true,
 	 // 自動再生。trueで自動再生される。
  	autoplay: true,
    dots: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    // 表示中の画像を中央へ
 	 centerMode: true,
 	// 中央のpadding
	centerPadding: '10px'
  });
});