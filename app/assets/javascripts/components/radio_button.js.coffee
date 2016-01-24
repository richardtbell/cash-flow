{div, label, input} = React.DOM

@RadioButton = React.createClass

  displayName: 'Radio button'

  handleChange: (e) ->
    @props.updateSelectedAnswer(@props.answer)

  getClasses: ->
    if @props.checked
      return 'checked'

  render: ->
    div className: 'answer',
      label className:@getClasses() , @props.answer,
        input type:'radio', onChange: @handleChange, checked: @props.checked
