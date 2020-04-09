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

var content = document.getElementById("dropdown-menu2");
var myDIV = document.getElementById("myDIV");
var tabContents = document.getElementsByClassName("tab-content");
console.log('hello');

for (var i = 0; i < tabContents.length; i++) {
  tabContents[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("is-active");
    current[0].className = current[0].className.replace("is-active", "");
    this.className += "is-active";
  });
}
