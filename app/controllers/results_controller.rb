class ResultsController < ApplicationController
  def create
    @result = Result.find_or_initialize_by(user_id: result_params['user_id'])
    question = get_question_value(result_params.except(:user_id))
    @result.update(question)
    if @result.save
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  private

    def get_question_value(question)
      csv = File.read(Rails.root + 'lib/question_data.csv')
      questions = CSV.parse(csv, headers: true)
      questionName = question.keys[0]
      questionIndex = questionName.slice('question').to_i
      questionValue = questions[questionIndex].select{|k,v| v == question[questionName]}.flatten[0]
      questionValue.slice!('points')
      question[questionName] = questionValue.strip.to_i
      return question
    end

    def result_params
      params.require(:result).permit(:user_id, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10)
    end
end