$(document).on 'turbolinks:load', ->
  event_links  = $('#navbar #event-links').hide()
  region_state = $('#navbar #region_number')

  if region_state.length
    event_links.show()

  region_state.change ->
    if $(this).val().length
      event_links.show()

      $.ajax
        type: 'PUT',
        url: '/regions',
        data: { region_number: $(this).val() }
    else
      event_links.hide()
