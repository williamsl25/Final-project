class TeachersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    if @user.admin_status
      @teachers = Teacher.all
    else 
      flash[:notice] = "You are not authorized to add an assignment"
      redirect_to assignments_path
    end
  end
    

  def new
    @user = current_user
    if @user.admin_status
      @teacher = Teacher.new
    else 
      flash[:notice] = "You are not authorized to add an assignment"
      redirect_to assignments_path
    end
    @programs = Program.all  
  end


  def show
    @teacher = Teacher.find params[:id]
    @user = current_user
    @students = @teacher.students
    @programs = if !params[:q].blank?
      @teacher.programs.where("name LIKE ? OR focus LIKE ? OR student_id LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @teacher.programs
    end
  end

  def create
    @user = current_user
    if @user.admin_status
    @teacher = Teacher.create teacher_params
    @teacher.user = @user
      if @teacher.save
        flash[:notice] = 'Teacher was successfully created'
        redirect_to @teacher
      else
        flash[:error] = "Teacher was NOT saved"
        render :new
      end
    else 
    flash[:notice] = "You are not authorized to create an teacher"
    redirect_to teachers_path
  end
  end

  def edit
    @teacher = Teacher.find params[:id]
    @programs = Program.all
    @students = Student.all
  end

  def update
    @user = current_user
    if @user.admin_status
      @students = Student.all 
      @teacher = Teacher.find params[:id]
      if @teacher.update_attributes teacher_params
        flash[:notice] = "Teacher was successfully Updated."
        redirect_to teachers_path
      else
        flash[:error] = "Teacher was NOT updated."
        render :new
      end
    else 
      flash[:notice] = "You are not authorized to update a teacher"
      redirect_to teachers_path
    end
  end

  def destroy
    @user = current_user
    if @user.admin_status
      @teacher = Teacher.find params[:id]
      @teacher.delete
      flash[:notice] = "#{@teacher.name} was deleted"
      redirect_to teachers_path
    else 
      flash[:notice] = "You are not authorized to update a teacher"
      redirect_to teachers_path
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :prefix,
      :name,
      :grade,
      :email,
      :admin_status,
      program_ids: [],
      user_id: []
      )
  end
  
  def find_student
    @student = Student.find params[:id]
  end

end
