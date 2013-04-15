class QuestionsController < ApplicationController
  def index
    @users = User.all
    @question = Question.new
    @questions = Question.todays_questions

    respond_to do |format|
      format.html
      format.json { render :json => @questions }
    end
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
