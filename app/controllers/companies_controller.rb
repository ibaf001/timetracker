class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  {render xml: @company}
      format.json {render json: @company}
    end
  end

  def new
    @company = Company.new 
  end
  

  def create
    @company = Company.new(params[:company].permit(:name))
    if @company.save
      flash[:notice] = 'Company Created'
      redirect_to @company
    else
      render 'new'
    end
  end


end
