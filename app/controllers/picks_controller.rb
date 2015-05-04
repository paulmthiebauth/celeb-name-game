class PicksController < ApplicationController
  def create
  total_picks = params[:pick].size
  counter = 1
  score = 0
  until counter > total_picks
    if params[:pick]["pick_number#{counter}"] == params["user_guess#{counter}"]
      score += 1
    end
    counter += 1
  end

  if signed_in?
    flash[:notice] = ["You scored #{score} out of #{total_picks} points for this round!"]
  else
    flash[:notice] = ["You scored #{score} out of #{total_picks} points for this round!  Sign up to keep track of your total score and to participate in the Leaderboards."]
  end
  redirect_to movie_path(params[:movie_id])
  end
end
