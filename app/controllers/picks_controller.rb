class PicksController < ApplicationController
  def create
  user = current_user.id
  total_picks = params[:pick].size
  counter = 1
  score = 0
  until counter > total_picks
    if params[:pick]["pick_number#{counter}"] == params["user_guess#{counter}"]
      score += 1
    end
    counter += 1
  end

  if Leader.where(user_id: user).empty?
    Leader.create(user_id: user, score: score)
  else
    current_score = Leader.where(user_id: user).first.score
    Leader.where(user_id: user).first.update(score: current_score + score)
  end

  if signed_in?
    flash[:notice] = ["You scored #{score} out of #{total_picks} points for this round!"]
  else
    flash[:notice] = ["You scored #{score} out of #{total_picks} points for this round!  Sign up to keep track of your total score and to participate in the Leaderboards."]
  end
  redirect_to movie_path(params[:movie_id])
  end
end
