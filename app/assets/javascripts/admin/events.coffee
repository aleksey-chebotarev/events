$(document).on 'turbolinks:load', ->
  $('.event_region #event_region_id').on 'change', ->
    event_url = $('.admin-events-form form').attr('action')
    event_value = event_url.substring(event_url.lastIndexOf('/') + 1)
    region_value = $(this).val()

    if region_value.length > 0
      $.ajax
        type: 'PUT',
        url: "/admin/events/#{event_value}",
        data: { region_id: region_value }
    else
      $('#admin-event-city-block').hide()
