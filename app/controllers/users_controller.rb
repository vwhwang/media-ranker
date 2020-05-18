class UsersController < ApplicationController

  def index 
    @users = User.all
  end 

  def login_form
    @user = User.new
  end

  def login

    user = User.find_by(username: params[:user][:username])

    if user.nil? 
      user = User.new(username: params[:user][:username])

      if !user.save
        flash.now[:error] = "unable to log in"
        return 
      else   
        flash[:welcome] = "Successfully created user #{user.username} with ID #{user.id}"
      end 
      
    else  
      flash[:welcome] = "Successfully logged in as existing user #{user.username}"
    end 

    session[:user_id] = user.id
    redirect_to root_path

  end


  def logout
    if session[:user_id]

      user = User.find_by(id: session[:user_id])

      unless user.nil? 
        session[:user_id] = nil 
        flash[:notice] = "Successfully logged out #{user.username}"
      else  
        session[:user_id] = nil 
        flash[:notice] = "Unknow user"
      end 
    else   
      flash[:error] = "you can not log out when you are not logged in"
    end 
    redirect_to root_path 
    return 
  end

end
