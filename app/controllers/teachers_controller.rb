class TeachersController < ApplicationController
  def index
    @teachers = if !params[:q].blank?
      Teacher.where("name LIKE ? OR grade LIKE ? OR email LIKE ? OR program_id LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @teachers = Teacher.all

    end

  end

  def new
    @teacher = Teacher.new
    @programs = Program.all
  end
  def show
    @teacher = Teacher.find params[:id]
    @programs = if !params[:q].blank?
      @teacher.programs.where("name LIKE ? OR focus LIKE ? OR student_id LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @teacher.programs
    end
  end

  def create
    @teacher = Teacher.create teacher_params
    if @teacher.save
      flash[:notice] = 'Teacher was successfully created'
      redirect_to @teacher
    else
      flash[:alert] = "Teacher was NOT saved"
      render :new
    end
  end
  
  def edit
    @teacher = Teacher.find params[:id]
    @programs = Program.all
    @students = Student.all
  end

  def update
    @teacher = Teacher.find params[:id]
    @teacher.update_attributes teacher_params
    if @teacher.update_attributes teacher_params
      flash[:notice] = "Teacher was successfully Updated."
      redirect_to teachers_path
    else
      flash[:alert] = "Teacher was NOT updated."
      render :edit
    end

  end

  def destroy
    @teacher = Teacher.find params[:id]
    @teacher.delete
    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :prefix,
      :name,
      :grade,
      :email,
      :admin_status,
      program_ids: []
      )
  end
  
  def find_student
    @student = Student.find params[:id]
  end

end
