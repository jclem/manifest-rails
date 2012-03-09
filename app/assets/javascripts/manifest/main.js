//= require jquery
//= require jquery_ujs
//= require tinymce-jquery
//= require_tree .

$(function() {
  $.fn.touchBind = function(fn) {
    $(this).live('click', function() {
      return fn.call(this);
    })

    $(this).live('touchmove', function() {
      $(this).addClass('dragged');
    });

    $(this).live('touchend', function() {
      if (!$(this).hasClass('dragged')) fn.call(this);
      $(this).removeClass('dragged');
    });

    return this;
  }

  $('.tinymce').tinymce({});

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

  $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('.app-content', { timeout: 10000 });

  $('tbody tr').touchBind(function() {
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
