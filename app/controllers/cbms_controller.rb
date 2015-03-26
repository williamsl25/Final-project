class CbmsController < ApplicationController
  

  def index
    @cbms = Cbm.all.sort_by{ |cbm| cbm.date_taken }
    @students = Student.all

    # respond_to do |format|
    #   format.json { render json: @cbms.to_json }
    # end
  end
  def edit
    @student = Student.find params[:id]
    @cbms = Cbm.all
  end
  def new
    @cbm = Cbm.new
  end

  def show
    set_cbm
    
  end

  def create

    @cbm = Cbm.create cbm_params
    @students = Student.all
    if @cbm.save
      flash[:notice] = 'cbm was successfully created.'
      redirect_to cbms_path
    else
      flash[:error] = 'cbm was NOT saved.'
      render :new
    end
    
  end


  def update
    set_cbm
    @cbm.update_attributes cbm_params
    
  end

  def destroy
    set_cbm
    @cbm.destroy
    
  end

  private
  def set_cbm
    @cbm = Cbm.find params[:id]
  end
  
  def cbm_params
    params.require(:cbm).permit(
      :date_taken,
      :score,
      :description,
      :student_id,
      
      )
  end
end
  
 
