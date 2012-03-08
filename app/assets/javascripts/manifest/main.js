//= require jquery
//= require jquery_ujs
//= require tinymce-jquery
//= require_tree .

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

  $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('.app-content', { timeout: 10000 });

  $('tbody tr').live('click', function() {
    controller = $(this).parent().parent().attr('id').split(':').pop();
    id = $(this).attr('id').split('_').pop();

    $.pjax({
      url: '/manifest/' + controller + '/' + id + '/edit',
      container: '.app-content'
    })
  });

  $(document).live('pjax:success', function () {
    $('.tinymce').tinymce({});
  });
})
