
//タグ検索よう
$(document).on('turbolinks:load', function(){
  $('.dropdown-category').on('click', function() {
    $('.dropdown-category').toggleClass('is-active');
  });
})

//タグ検索よう
$(document).on('turbolinks:load', function(){
  $('.dropdown-room').on('click', function() {
    $('.dropdown-room').toggleClass('is-active');
  });
})
