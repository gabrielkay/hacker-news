class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if params[:up_vote]
      @vote.vote_type = 1
    elsif params[:down_vote]
      @vote.vote_type = -1
    end
    if (@vote.save)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      # Not sure how to render errors
    end
  end

  def vote_params
     params.require(:vote).permit(:votable_type, :votable_id, :vote_type)
  end
end
