class WorksController < ApplicationController
  
  def index
    @works = Work.all.group_by{|work| work.category}
    @category = @works.keys
  end 
  
  def show 
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

    if @work.nil? 
      redirect_to works_path
      return 
    end 
  end 

  def new 
    @work = Work.new
  end 
  
  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work.id)
      return 
    else  

      if @work.errors.messages[:title].include?("can't be blank")
        flash.now[:errors] = "can not create title if nil"
      else  
        existing_work = Work.find_by(title: @work.title) 
        flash.now[:errors] = "#{existing_work.title} already existis"
      end 

      render :new 
      return 

    end 
  end 

  def edit 
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return 
    end 
  end 

  def update
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return 
    elsif @work.update(work_params)
      redirect_to work_path(@work.id)
      return 
    else  
      flash.now[:errors] = "can not edit if title is nil"
      render :edit 
      return 
    end 
  end 

  def destroy 
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    else   
      @work.destroy
      redirect_to works_path
      return 
    end 
  end 

  private 

  def work_params
    return params.require(:work).permit(:category, :title, :publication_year, :creator, :description)
  end 

end
