
$(document).ready(function() {
    
    // 495,271
    //height = 
    //alert(     $('.ui-li-thumb').parent().width()    )

  //alert($('.ui-li-thumb').parent().width())
    //alert($(window).width())

    /*
    should_jump = document.location.href.match(/\?jump\=([a-zA-Z0-9]+)/);

    if(should_jump != null) {
        if($('#'+should_jump[1]).length > 0) {
            pos = $('#'+should_jump[1]).position();
            setTimeout("$('body').scrollTop(pos['top'])",250) 
        }
    }
    
    */
    //checkJump()
});


$('div').live('pagecreate',function(){

    $('#quickjump span').click(function() {
        doJump($(this).html())
    });
    /*
    if (     $('.imgday').parent().width()  > 0  ) { // if it's 0 we have full width and it hasn't been affected by max-width
      ratio = $('.imgday').parent().width()/495; // 0.547475, ($('.ui-li-thumb').parent().width() = width the images will be when loaded, since they have max width 100%)
      if(ratio < 1) {
          height = 271*ratio;
          $('.imgday').css('height',height+'px');
      }else{
          $('.imgday').css('height','272px'); 
      }
    }
    */
});

function doJump(whereTo) {
    
           if($('#'+whereTo).length > 0) {
               pos = $('#'+whereTo).position();
               setTimeout("toppx = $('#" + whereTo  + "').position()['top']; $('body').scrollTop(toppx)",100) 
           }
}