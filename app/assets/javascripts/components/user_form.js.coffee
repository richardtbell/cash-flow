{form, div, input, button} = React.DOM

@UserForm = React.createClass

  displayName: 'User Form'

  getInitialState: ->
    name: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.name.length > 0

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/users', { user: @state }, (data) =>
      ReactDOM.render(
        React.createElement(Questions, user:data),
        document.getElementById('content')
      )
    , 'JSON'

  render: ->
    form className: 'form form--user', onSubmit: @handleSubmit,
      div className: 'form-group',
        input className: 'form--user__name', type: 'text', placeholder: 'Name', name: 'name', value: @state.name, onChange: @handleChange
      button className: 'btn btn-primary', type: 'submit', disabled: !@valid(), 'Start'