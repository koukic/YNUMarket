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

$(document).on('turbolinks:load', function(){
  $('.dropdown').on('click', function() {
    $('.dropdown').toggleClass('is-active');
  });
  $('.dropdown-item a').on('click', function() {
    $('.dropdown').toggleClass('is-active');
  });
})
