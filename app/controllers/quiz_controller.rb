require "csv"
class QuizController < ApplicationController
  def index
  end

  def get_questions
    csv = File.read(Rails.root + 'lib/question_data.csv')
    csv = CSV.parse(csv, headers: true)
    questions = []
    csv.each do |row|
      questions.push row.to_hash
    end
    render json: questions.to_json
  end
end