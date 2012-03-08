//= require jquery
//= require jquery_ujs
//= require tinymce-jquery

$(function() {
  $('.tinymce').tinymce({});

  $('#content_block_allow_html').change(function() {
    if ($(this).is(':checked')) {
      $('#content_block_content').tinymce({});
    } else {
      $('#content_block_content_container').remove();
      $('#content_block_content').css('display', 'inline-block');
      $('#content_block_content').attr('aria-hidden', 'false');
    }
  })

  $(".nav-select").change(function() {
    window.location = $(this).find("option:selected").val();
  });
})
