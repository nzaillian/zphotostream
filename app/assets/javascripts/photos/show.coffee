class window.App.Views.Photos.Show
  constructor: ->
    @bind_swipe_events()

  bind_swipe_events: =>
    $(document).on 'swipeleft', ->
      if $('.js-next-photo-link').length
        window.location = $('.js-next-photo-link').attr('href')

    $(document).on 'swiperight', ->
      if $('.js-prev-photo-link').length
        window.location = $('.js-prev-photo-link').attr('href')