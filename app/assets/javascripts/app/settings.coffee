$('#settings').ready ->
  if ($('#settings').length > 0)

    root = exports ? this

    root.onSelectionChanged = ->
      document.getElementById('edit_configuration_1').submit()
