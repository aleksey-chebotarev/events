$(document).ready ->
  $('#navbar #region_number').change ->
    region_state = $(this).val()

    if region_state.length > 0
      $.ajax
        type: 'PUT',
        url: '/regions',
        data: { region_number: region_state }
