$(function(){
    var i = 0;
    var $slider = $('.slide img');

    function slide(){
    if(i < 2){
      console.log(i);
      $slider.animate({left: '-=800'});
      i++;
     } else {
      $slider.animate({left: '0'});
      i=0;
     }
    }
    setInterval(slide, 3000);
});

