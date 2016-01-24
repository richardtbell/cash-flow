{div, h2, table, thead, tr, th, tbody, button} = React.DOM

@Results = React.createClass

  displayName: 'Results'

  getInitialState: ->
    results: []

  componentDidMount: ->
    @getResults()

  getResults: ->
    $.getJSON '/results'
      .success (data) =>
        @setState results: data

  handleClick: ->
    location.reload()

  render: ->
    div null,
      h2 className: 'title', 'Results'
        table null,
          thead null,
            tr null,
              th null, 'Name'
              for i in [1..10] by 1
                th key:i, 'Q' + i
              th null, 'Total'
          tbody null,
            for result, index in @state.results
              React.createElement ResultsRow, {result, key: index}
      button className: 'btn btn-primary', onClick: @handleClick, 'Try again'