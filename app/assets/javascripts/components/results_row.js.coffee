{tr, td} = React.DOM

@ResultsRow = React.createClass

  displayName: 'Results Row'

  getTotal: ->
    totalScore = 0
    for i in [1..10] by 1
      totalScore += @props.result['question' + i]
    return totalScore

  render: ->
    tr key:@props.key,
      td null, @props.result.name
      for i in [1..10] by 1
        td key:i, @props.result['question' + i]
      td null, @getTotal()

