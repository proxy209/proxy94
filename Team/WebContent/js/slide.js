$( function () {

  // 슬라이드(좌우)
  var w = $( '.hidden' ).width();//슬라이드 영역 너비
  var frame = $( ' .frame' );      //프레임
  var item = $( '.slide-img' );  //이미지(배경)
  var c = item.length;  //이미지 개수

  //프레임의 너비
  item.width( w );

  for( var k in item ) {
    item.eq( k ).css( 'left', i * w ); //이미지 가로 배치
  }

  var i = 0;

  function slide () {
    var n = ( i + 1 ) % c;  //다음 이미지의 인덱스
    item.eq( i ).animate( { left: w * (-1) }, 600 );
    item.eq( n ).animate( { left: 0 }, 600 );
    item.eq( n + 1 ).animate( { left: w }, 600 );

    item.eq( i ).animate( { left: w  }, 0 );
     frame.append( item.eq( i ) ); 
    i = n;
  }

  var inter = setInterval( slide, 4000 ); //4초 간격으로 slide 호출
 
  


} );



