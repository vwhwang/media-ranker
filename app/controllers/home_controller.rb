class HomeController < ApplicationController

  def index
    @top_work = Work.all.sample(1)
    @works = Work.all.group_by{|work| work.category}
    @category = @works.keys
  end 
end
