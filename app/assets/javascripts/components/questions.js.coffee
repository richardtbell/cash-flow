{form, div, button} = React.DOM

@Questions = React.createClass

  displayName: 'Question'

  getInitialState: ->
    userId: @props.user.id,
    questionNumber: 0,
    question: '',
    answers: '',
    selectedAnswer: '',
    totalScore: 0

  handleSubmit: (e) ->
    e.preventDefault()
    result = {
      user_id: @state.userId
    }
    result['question' + (@state.questionNumber + 1)] = @state.selectedAnswer
    $.post '/results', {result}, (data) =>
      @setCurrentScore(data)
      if @state.questionNumber < 9
        @setState questionNumber: @state.questionNumber + 1
        @getQuestionData()
      else
        ReactDOM.render(
          React.createElement(Results),
          document.getElementById('content')
        )

    , 'JSON'

  componentDidMount: ->
    @getQuestionData()

  valid: ->
    @state.selectedAnswer.length > 0

  updateSelectedAnswer: (answer) ->
    @setState selectedAnswer: answer

  setCurrentScore: (data) ->
    totalScore = 0
    for i in [1..10] by 1
      totalScore += data['question' + i]
    @setState {totalScore}


  getQuestionData: ->
    $.getJSON '/getQuestionData.json'
      .success (data) =>
        @setState question: data[@state.questionNumber]['question']
        @setState answers: data[@state.questionNumber]['answers']

  render: ->
    div null,
      div className: 'score-tally', 'Points so far: ' + @state.totalScore
      form className:'form form-multiple-choice', onSubmit: @handleSubmit,
        div className:'question', (@state.questionNumber + 1) + ' : ' + @state.question
        div className:'answers',
          for answer, index in @state.answers
            React.createElement RadioButton, {answer, updateSelectedAnswer: @updateSelectedAnswer, checked: @state.selectedAnswer == answer, key: index}
        button className:'btn btn-primary', type: 'submit', disabled: !@valid(), 'Next'
