class QuestionsController < ApplicationController
  def index
    @users = User.all
    @question = Question.new
    @questions = Question.todays_questions
  end

  def create
    @question = current_user.questions.new(params[:question])

    if @question.save
      render json: @question
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
end
