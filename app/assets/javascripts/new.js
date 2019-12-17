$(document).on('turbolinks:load', function(){
  $('#new_event').on('submit', function(){
    var address = $('.false-place').val();
    $('.true-place').val(address);
  });

  $('.start_on__form').change(function(){
    var start = $(this).val();
    $('.end_on__form').attr('value',start);
    $('.end_on__form').attr('min',start);
  });

  $('.end_on__form').change(function(){
    var end = $(this).val();
    $('.start_on__form').attr('max',end);
  });
})
