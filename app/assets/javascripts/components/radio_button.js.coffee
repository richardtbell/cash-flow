{label, input} = React.DOM

@RadioButton = React.createClass

  displayName: 'Radio button'

  handleChange: (e) ->
    @props.updateSelectedAnswer(@props.answer)

  render: ->
    label className:'answer', @props.answer,
      input className:'answer', type:'radio', onChange: @handleChange, checked: @props.checked
