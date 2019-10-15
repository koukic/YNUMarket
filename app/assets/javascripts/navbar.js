$(document).on('turbolinks:load', function(){
   if ($('#userLayout').length === 0) {
     return;
   }
 
   $('.header__toggle').on('click', function() {
     $('.header__list').toggleClass('header__list--hidden');
     $('.header__show-menu-image').toggleClass('header__show-menu-image--hidden');
     $('.header__close-menu-image').toggleClass('header__close-menu-image--hidden');
   });
 
   $('.header__item a').on('click', function() {
     $('.header__list').toggleClass('header__list--hidden');
     $('.header__show-menu-image').toggleClass('header__show-menu-image--hidden');
     $('.header__close-menu-image').toggleClass('header__close-menu-image--hidden');
   });
 });