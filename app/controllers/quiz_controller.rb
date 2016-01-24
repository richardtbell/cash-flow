require "csv"
class QuizController < ApplicationController
  def index
  end

  def get_questions
    csv = File.read(Rails.root + 'lib/question_data.csv')
    csv = CSV.parse(csv, headers: true)
    questions = []
    csv.each do |row|
      row = row.to_hash
      question = row['Question']
      answers = []
      row.each do |key, value|
        if key != 'Question'
          answers.push value
        end
      end
      question_block = {question: question, answers: answers}
      questions.push question_block
    end
    render json: questions.to_json
  end
end