class WorksController < ApplicationController
  def index
    #@works = Work.all
    if (params[:days])
      @works = Work.recentdays(params[:days]).order('datetimeperformed desc')
    else
      @works = Work.all.order('datetimeperformed desc')
    end
  end 

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
    if @work.save
      flash[:notice] = 'Work Created'
      redirect_to @work
    else
      render 'new'
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
      flash[:notice] = 'Work Updated'
      redirect_to @work
    else
      render 'edit'
    end
  end
 
end
