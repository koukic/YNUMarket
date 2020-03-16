$(function(){
    $('#information_image').change(function(){
        $('img').remove();
        var file = $(this).prop('files');
        $(file).each(function(i) {
        if(!file[i].type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('#result').append('<img src="' + fileReader.result + '"/>');
        }
        fileReader.readAsDataURL(file[i]);
        });
    });
});

$(function() {
   var query = window.location.search;
   var number = query.replace('?page=', '');
   if(number = ""){
     var num = 0
   }else {
     var num = number - 1
   }
   var result = document.getElementsByClassName('is_current');
   $('result[num]').css('background-color', '#0ff');   // 背景色を設定
 });
