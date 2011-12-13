

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

if (navigator.userAgent.match(/iPhone/i)) {
    $(window).bind('orientationchange', function(event) {
        if (window.orientation == 90 || window.orientation == -90 || window.orientation == 270) {
            $('meta[name="viewport"]').attr('content', 'height=device-width,width=device-height,initial-scale=1.0,maximum-scale=10.0');
        } else {
            $('meta[name="viewport"]').attr('content', 'height=device-height,width=device-width,initial-scale=1.0,maximum-scale=1.0');
        }
    }).trigger('orientationchange');
}