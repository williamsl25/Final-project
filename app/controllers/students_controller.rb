class StudentsController < ApplicationController
before_action :authenticate_user!

  def index
    @students = Student.accessible_by(current_ability)
    @programs = Program.all
    @teachers = Teacher.all
    authorize! :read, Student
  end

  def show
    @student = Student.find params[:id]
    @user = current_user
    @programs = @student.programs
    @teachers = Teacher.all
    @students = Student.accessible_by(current_ability)
    
    @comment = Comment.new
    @cbm = Cbm.new
    @cbms = @student.cbms.sort_by{ |cbm| cbm.date_taken}
    authorize! :read, @student
  end

  def new
    @student = Student.new
    @programs = Program.all
    authorize! :create, @student
  end

  def edit
    @student = Student.find params[:id]
    @programs = Program.all
  end

  def create
    @student = Student.create student_params
    @student.user = current_user
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
    @comment.commentable = @student
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Your comment was successfully created.'

      # UserMailer.comment_email(current_user, @comment).deliver
      # UserMailer.student_user_comment_email(@student, @comment).deliver
    redirect_to student_path(@student)
    else
      flash[:notice] = 'Your comment was NOT successfully created.'
      render :new
    end
  end

  def create_student_cbm
    @student = Student.find params[:id]
    @cbm = @student.cbms.create cbm_params
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find params[:id]
      if @student.update_attributes student_params
      flash[:notice] = "Student was successfully updated!"
      redirect_to student_path(@student)
    else
      flash[:error] = "Student was NOT updated." 
      render :edit
    end
  end

  def destroy
    @student = Student.find params[:id]
    @student.delete
    flash[:notice] = "Student successfully deleted"
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
      program_ids: [],
      user_ids: [],
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :user_id
      )

  end
  def student_cbm_params
    params.require(:comment).permit(
      :date_taken,
      :score,
      :description,
      :student_id,
      :user_id
      )

  end

end
