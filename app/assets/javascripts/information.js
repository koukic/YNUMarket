//タブよう
$(document).on('turbolinks:load', function () {
  var content = document.getElementById("dropdown-menu2");
  var myDIV = document.getElementById("myDIV");
  var tabContents = document.getElementsByClassName("tab-content");
  console.log('myDIV');
  console.log('hello');
  for (var i = 0; i < tabContents.length; i++) {
    console.log('tabContents');
    tabContents[i].addEventListener("click", function () {
      var current = document.getElementsByClassName("is-active");
      current[0].className = current[0].className.replace("is-active", "");
      this.className += " is-active";
    });
  }
})


//タグ検索よう
$(document).on('turbolinks:load', function(){
  $('.dropdown').on('click', function() {
    $('.dropdown').toggleClass('is-active');
  });
  $('.dropdown-item a').on('click', function() {
    $('.dropdown').toggleClass('is-active');
  });
})
