class HomeController < ApplicationController

  def index
    @top_work = Work.all.sample(1)
    @works = Work.all
  end 
end
