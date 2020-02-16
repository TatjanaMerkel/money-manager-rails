$('#edit-record').ready ->
  if ($('#edit-record').length > 0)
    el = (id) ->
      document.getElementById id

    canvas = el('canvas')
    context = canvas.getContext('2d')

    drawImageScaled = (img, ctx) ->
      canvas = ctx.canvas
      hRatio = canvas.width / img.width
      vRatio = canvas.height / img.height
      ratio = Math.max(hRatio, vRatio)
      centerShift_x = (canvas.width - (img.width * ratio)) / 2
      centerShift_y = (canvas.height - (img.height * ratio)) / 2
      ctx.clearRect 0, 0, canvas.width, canvas.height
      ctx.drawImage img, 0, 0, img.width, img.height, centerShift_x, centerShift_y, img.width * ratio, img.height * ratio
      return

    drawImageScaledFit = (img, ctx) ->
      canvas = ctx.canvas
      hRatio = canvas.width / img.width
      vRatio = canvas.height / img.height
      ratio = Math.min(hRatio, vRatio)
      centerShift_x = (canvas.width - (img.width * ratio)) / 2
      centerShift_y = (canvas.height - (img.height * ratio)) / 2
      ctx.clearRect 0, 0, canvas.width, canvas.height
      ctx.drawImage img, 0, 0, img.width, img.height, centerShift_x, centerShift_y, img.width * ratio, img.height * ratio
      return

    drawImageScaled(document.getElementById("entry_image"), context)

    readImage = ->
      if @files and @files[0]
        fileReader = new FileReader

        fileReader.onload = (e) ->
          img = new Image
          img.addEventListener 'load', ->
            drawImageScaled(img, context)
            return
          img.src = e.target.result
          return

        fileReader.readAsDataURL @files[0]
      return

    el('fileUpload').addEventListener 'change', readImage, false