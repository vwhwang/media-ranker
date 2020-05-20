class VotesController < ApplicationController

  before_action :require_login


  def upvote

    @vote = Vote.all.find_by(work_id:params[:work_id] ,user_id: session[:user_id])

    if @vote.nil? 
      Vote.create(work_id:params[:work_id] ,user_id: session[:user_id]) 
      flash[:message] = "Successfuly upvoted!"
    else   
      flash[:errors] = "has already voted for this work"
    end 

    redirect_back(fallback_location: root_path)
  end

end
