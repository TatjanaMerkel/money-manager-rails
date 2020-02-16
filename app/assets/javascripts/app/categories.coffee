$('#categories').ready ->
  if ($('#categories').length > 0)

    modal = document.getElementById('colorDialog')
    iconDialog = document.getElementById('iconDialog')
    form_id = -1

    # export function to make it available in HTML attributes
    # see: https://stackoverflow.com/questions/10458891/calling-functions-defined-with-coffee-script

    root = exports ? this

    root.showColorDialog = (id) ->
      form_id = id
      modal.style.display = 'block'
      return

    root.setColor = (color) ->
      form = document.getElementById('edit_category_' + form_id)
      form.childNodes.item(4).value = color
      form.submit()
      setTimeout (->
        window.location.reload()
        return
      ), 100

    root.setIcon = (icon) ->
      form = document.getElementById('edit_category_' + form_id)
      form.childNodes.item(8).value = icon
      form.submit()
      setTimeout (->
        window.location.reload()
        return
      ), 100

    root.showIconDialog = (id) ->
      form_id = id
      iconDialog.style.display = 'block'
      return

    # When the user clicks anywhere outside of the modal, close it

    window.onclick = (event) ->
      if event.target == modal
        modal.style.display = 'none'

      if event.target == iconDialog
        iconDialog.style.display = 'none'

      return