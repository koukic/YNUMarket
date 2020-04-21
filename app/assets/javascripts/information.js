
//タグ検索よう
$(document).on('turbolinks:load', function(){
  $('.dropdown-category').on('click', function() {
    $('.dropdown-category').toggleClass('is-active');
  });
})
