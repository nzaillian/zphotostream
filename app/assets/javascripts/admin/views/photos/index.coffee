class window.App.Views.Admin.Photos.Index
  constructor: ->
    $('.js-admin-photos-grid').sortable({
      update: @handle_update
    })
    $('.js-admin-photos-grid').disableSelection()

  handle_update: (e, ui) =>
    counter = window.base_image_position

    $els = $('.js-photo-wrap[data-id]')

    positions = []

    $els.each ->
      positions.push({
        id: $(this).attr('data-id'),
        position: counter
      })

      counter -= 1

    $.ajax
      type: 'POST'
      url: window.position_update_url
      data: {positions: positions}
      success: ->
        ui.item.effect('highlight', {}, 700)
