var charm_flash_stack = { dir1: 'up', dir2: 'left', firstpos1: 25, firstpos2: 25 }

function charm_flash(type, message, closer, hide) {
  $.pnotify({
    type: type,
    text: message,
    shadow: false,
    history: false,
    sticker: false,
    icon: false,
    closer: closer,
    hide: hide,
    stack: charm_flash_stack,
    before_open: function($pnotify) {
      $pnotify.find('.ui-pnotify-closer').html('×')
    }
  })
}

$(document).on('ready page:change', function() {
  $('.charm-flash').each(function() {
    var $flash = $(this)
    var type = $flash.data('type')
    var message = $flash.html()
    var closer = $flash.data('closer')
    var hide = $flash.data('hide') || (type == 'success' || type == 'info')

    charm_flash(type, message, closer, hide)
  })
})
