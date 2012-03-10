//= require jquery
//= require jquery_ujs
//= require tinymce-jquery
//= require_tree .

$(function() {
  $('.tinymce').tinymce({});

  // Toggle tinyMCE when checkbox value changes.
  $('#content_block_allow_html').live('change', function() {
    if ($(this).is(':checked')) {
      $('#content_block_content').tinymce({});
    } else {
      $('#content_block_content_container').remove();
      $('#content_block_content').css('display', 'inline-block');
      $('#content_block_content').attr('aria-hidden', 'false');
    }
  })

  $(".nav-select").change(function() {
    $.pjax({
      url: $(this).find('option:selected').val(),
      container: '.app-content'
    })
  });

  $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('.app-content', { timeout: 1000 });

  $('.app-content').on('click', 'tbody tr', function() {
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
