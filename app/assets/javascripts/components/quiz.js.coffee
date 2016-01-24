{div, h2} = React.DOM

@Quiz = React.createClass

  displayName: 'Quiz'

  render: ->
    div className: 'quiz',
      h2 className: 'title', 'Welcome to the Cash Flow Quiz'
      React.createElement UserForm

