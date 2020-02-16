get_date = -> new Date().toISOString().slice(0, 19).replace('T', ' ')
GREEN = '#b6ffb9'
RED = '#ff6c7a'


$ ->
  plus_minus_open = false

  set_btn = (type) ->
    $currentButton = $("#signPlus")
    
    $currentButton
      .removeClass('plus')
      .removeClass('minus')
      .addClass(type)
      .children('i.fas')
      .removeClass('fa-plus')
      .removeClass('fa-minus')
      .addClass("fa-#{type}")
    
    $('#choosePlusMinus').remove()
    plus_minus_open = false

    set_color()

  set_color = ->
    $plus = $('#signPlus')
    color = ''

    if $plus.hasClass('minus')
      color = RED
    else
      color = GREEN

    $('.money').css
      'background-color': color


  clear_form = ->
    # -- Add Date to Form as hidden Field
    $('<input>')
      .attr('type', 'hidden')
      .attr('name', 'entry[date]')
      .attr('value', get_date())
      .appendTo($('#new_entry'))
    # --

    $amount = $('#value')

    # -- set sign to plus when amount is negative
    # --

    # -- remove negative value in amount-field

    if $amount.val() < 0
      $amount.val(-$amount.val())
      set_btn('minus')
    # --

  set_plus_minus = (selected_category_val) ->

    selected_category = $("#entry_category_id>option[value=#{selected_category_val}]")

    if selected_category.data('is-expense')
      set_btn('minus')
    else
      set_btn('plus')

  change_icon = ($svg, data, $icon) ->

  set_icon = ->
    category_id = $('#entry_category_id').val()
    if (category_id == null)
      return

    $icon = $('#categoryIcon')

    $.get "/app/categories/#{category_id}/svg", (data) ->

      $svg = $icon.children('svg')
      if $svg
        $svg.fadeOut(200)
        $svg = $(data.firstChild)
        $svg.css('display', 'none')
        # Set icon
        $icon.empty()
        $icon.append($svg)
        $svg.fadeIn(200)

        color = $svg.css('fill')
        $('#appBar').css 'background-color', color


  # --- Code starts
  if $('#edit-record').length

    clear_form()

    $('#entry_category_id').change ->
      set_plus_minus($('#entry_category_id').val())
      set_icon()

    $('#currency').on 'click', (e) ->
      e.preventDefault()

    $('form.edit-entry').on 'submit', (e) ->
      if $('#signPlus').hasClass('minus')
        valInput = $('#value')
        valInput.val(-> valInput.val() * -1)

    $('#currency, #signPlus').click (e) ->
      e.preventDefault()

    set_color()
    set_icon()