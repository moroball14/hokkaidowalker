$(document).on('turbolinks:load', function(){
  $('.js-modal-open').on('click',function(){
    $('.js-modal').fadeIn();
    return false;
  });
  $('.js-modal-close').on('click',function(){
    $('.js-modal').fadeOut();
    return false;
  });

  $('.js-modal-open1').on('click',function(){
    $('.js-modal1').fadeIn();
    $('.modal__input').focus();
    return false;
  });
  $('.js-modal-close1').on('click',function(){
    $('.js-modal1').fadeOut();
    return false;
  });

  $('.modal__submit').on('click',function(){
    $('.js-modal1').fadeOut();
    return false;
  });

  $('.dropdown-trigger').dropdown();

  setTimeout("$('.flash-index').fadeOut('slow')", 3000)
});