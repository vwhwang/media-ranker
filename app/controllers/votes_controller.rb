class VotesController < ApplicationController

  def upvote

    if session[:user_id].nil? 
      flash[:error] = "You must login to do that"
      redirect_to work_path(id: params[:work_id])
      return 
    end 

    @vote = Vote.all.find_by(work_id:params[:work_id] ,user_id: session[:user_id])
    if @vote.nil? 
      Vote.create(work_id:params[:work_id] ,user_id: session[:user_id]) 
      flash[:message] = "Successfuly upvoted!"
    else   
      flash[:error] = "has already voted for this work"
    end 

    redirect_back(fallback_location: root_path)
  end

end
