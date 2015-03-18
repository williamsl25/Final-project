class StudentsController < ApplicationController

  def index
    @students = Student.all
    @programs = Program.all
    @teachers = Teacher.all
  end


  def show
    @student = Student.find params[:id]
    @programs = @student.programs
    @teachers = Teacher.all
    @comment = Comment.new
    @cbm = Cbm.new
    @cbms = @student.cbms
  end

  def new
    @student = Student.new
    @programs = Program.all

  end

  def edit
    @student = Student.find params[:id]
    @programs = Program.all
  end

  def create
    @student = Student.create student_params
    if @student.save
      flash[:notice] = 'student was successfully created.'
      redirect_to students_path
    else
      flash[:error] = 'student was NOT saved.'
      render :new
    end
  end

  def create_comment
    @student = Student.find params[:id]
    @comment = @student.comments.create comment_params
    redirect_to student_path(@student)
  end
  def create_student_cbm
    @student = Student.find params[:id]
    @cbm = @student.cbms.create cbm_params
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find params[:id] 
      if @student.update_attributes student_params
      redirect_to student_path(@student)
    else 
      render :new
    end
  end

  def destroy
    @student = Student.find params[:id]
    @student.delete
    redirect_to students_path
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.commentable
  end

  def destroy_student_cbm
    @cbm = Cbm.find params[:id]
    @cbm.destroy
    redirect_to @cbm.cbmable
  end

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :strengths,
      :weaknesses,
      teacher_ids: [],
      program_ids: []
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content
      )

  end
  def student_cbm_params
    params.require(:comment).permit(
      :date_taken,
      :score,
      :description,
      :student_id,
      )

  end

end
