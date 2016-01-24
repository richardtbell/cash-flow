{form, div, label, input, button} = React.DOM

@Questions = React.createClass

  displayName: 'Question'

  getInitialState: ->
    user: @props.user.id,
    questionNumber: 0,
    question: '',
    firstAnswer: '',
    secondAnswer: '',
    thirdAnswer: '',
    fourthAnswer: '',
    selectedAnswer: ''

  handleSubmit: (e) ->
    e.preventDefault()
    @setState questionNumber: @state.questionNumber + 1
    @getQuestionData()

  componentDidMount: ->
    @getQuestionData()

  valid: ->
    @state.selectedAnswer.length > 0

  handleChange: (e) ->
    @setState selectedAnswer: e.target.labels[0].innerHTML

  getQuestionData: ->
    self = @
    $.getJSON '/getQuestionData.json'
      .success (data) =>
        @setState question: data[@state.questionNumber]['Question']
        @setState firstAnswer: data[@state.questionNumber]['15 points']
        @setState secondAnswer: data[@state.questionNumber]['10 points']
        @setState thirdAnswer: data[@state.questionNumber]['5 points']
        @setState fourthAnswer: data[@state.questionNumber]['0 points']

  render: ->
    form className:'form form-multiple-choice', onSubmit: @handleSubmit,
      div className:'question', @state.question
      div className:'answers',
        input className:'answer', type:'radio', id: 'radio-button-1', onChange: @handleChange
        label className:'answer', htmlFor:'radio-button-1', @state.firstAnswer
        input className:'answer', type:'radio', id: 'radio-button-2', onChange: @handleChange
        label className:'answer', htmlFor:'radio-button-2', @state.secondAnswer
        input className:'answer', type:'radio', id: 'radio-button-3', onChange: @handleChange
        label className:'answer', htmlFor:'radio-button-3', @state.thirdAnswer
        input className:'answer', type:'radio', id: 'radio-button-4', onChange: @handleChange
        label className:'answer', htmlFor:'radio-button-4', @state.fourthAnswer
      button className:'btn btn-primary', type: 'submit', disabled: !@valid(), 'Next'
