class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(params[:question_id])

    if @vote.save
      render json: @vote
    else
      render :nothing, status: :unprocessable_entity
    end
  end
end
