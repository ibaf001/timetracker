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
 
end
