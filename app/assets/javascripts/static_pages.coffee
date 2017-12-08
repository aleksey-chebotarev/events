$(document).on 'turbolinks:load', ->
  $('#navbar #region_number').change ->
    if $(this).val().length
      $.ajax
        type: 'PUT',
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        url: '/regions',
        data: { region_number: $(this).val() }
