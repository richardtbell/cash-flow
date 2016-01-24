{tr, td} = React.DOM

@User = React.createClass

  displayName: 'User'

  render: ->
    tr null,
      td null, @props.user.name
      td null, @props.user.created_at
