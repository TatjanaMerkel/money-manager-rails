$('#overview').ready ->
  if ($('#overview').length > 0)
    month = (new Date()).getMonth() + 1
    $.ajax
      url: "/charts/2020/#{month}?type=categories"
      success: (result) ->
        drawChart = ->

          categoryColors = []
          for row in result
            categoryColors.push(row.shift())
          
          # TODO negative values handling (this is just a hotfix)
          result.forEach (element) ->
            num = element[1]
            if num < 0
              element[1] = -num

          result.unshift(['Category', 'Money'])
          data = google.visualization.arrayToDataTable(result)

          options =
            pieHole: 0.5
            colors: categoryColors
            legend:
              maxLines: 3
              position: 'top'
              textStyle:
                color: 'blue'
                fontSize: 14

          chart = new google.visualization.PieChart(document.getElementById('donutchart'))
          chart.draw data, options

        google.charts.load 'current', 'packages': ['corechart']
        google.charts.setOnLoadCallback drawChart