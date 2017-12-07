$(document).on 'turbolinks:load', ->
  $('.event_region #event_region_id').on 'change', ->
    region_value = $(this).val()

    if region_value.length > 0
      $.ajax
        type: 'PUT',
        url: "/admin/events/#{region_value}"
    else
      $('#admin-event-city-block').hide()
