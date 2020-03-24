$( function() {

  $( '.tab > li ' ).click( function (){
    var i = $( this ).index(); //클릭한 탭 인덱스
    $( '.tab > li ' ).not( this ).removeClass( 'on' ); //이전 탭의 .on 제거
    $( this ).addClass( 'on' ); //클릭한 탭에 .on 부여
 
  });

  /* 초기화 */
  var $grid = $('.con-wrap').isotope({
    itemSelector: '.con'
  });

  /* 필터 버튼 연결 */
  $('#filters').on('click', 'li' , function () {
    var df = $( this ).attr( 'data-filter' );
    $grid.isotope( { filter: df });
  });


});