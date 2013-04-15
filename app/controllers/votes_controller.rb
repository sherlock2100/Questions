class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(question_id: params[:question_id])

    if @vote.save
      render json: @vote
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
end
