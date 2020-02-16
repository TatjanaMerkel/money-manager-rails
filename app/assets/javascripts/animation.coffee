$ ->
    labels = $('.mdc-floating-label')

    labels.each (index) ->
        $self = $(this)
        e = $self.attr('for')

        $target = $("##{e}")

        if $target.val()
          $self.animate
            'margin-bottom': '20px'
            'font-size': '12px'


        $target.on 'click', ->
              $self.animate
                      'margin-bottom': '20px'
                      'font-size': '12px'



            