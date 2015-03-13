class StudentsController < ApplicationController

  def index
    @students = Student.all
    @programs = Program.all
    @teachers = Teacher.all
  end


  def show
    @student = Student.find params[:id]
    @programs = @student.programs
    @programs = Program.all
    @teachers = Teacher.all
    @comment = Comment.new
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

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :strengths,
      :weaknesses,
      program_id: []
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content
      )

  end

end
