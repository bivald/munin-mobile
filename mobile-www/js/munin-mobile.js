

$('div').live('pagecreate',function(){

    $('#quickjump span').click(function() {
        doJump($(this).html())
    });
});

function doJump(whereTo) {
    
           if($('#'+whereTo).length > 0) {
               pos = $('#'+whereTo).position();
               setTimeout("toppx = $('#" + whereTo  + "').position()['top']; $('body').scrollTop(toppx)",100) 
           }
}