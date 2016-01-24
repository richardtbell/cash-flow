{div, h2, table, thead, tr, th, tbody} = React.DOM

@Users = React.createClass

  displayName: 'Users'

  getInitialState: ->
    users: @props.data

  getDefaultProps: ->
    users: []

  addUser: (user) ->
    users = @state.users.slice()
    users.push user
    @setState {users}

  render: ->
    div className: 'users',
      h2 className: 'title', 'Users'
      table className: 'users__table',
        thead null,
          tr null,
            th null, 'User'
            th null, 'Date'
        tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user
      React.createElement UserForm, handleNewUser: @addUser

