class ProgramsController < ApplicationController
  
  # before_action :authenticate_user!

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
    @students = Student.all
    @teachers = Teacher.all
    authorize! :create, Program
  end

  def create
    @program = Program.create program_params
    @students = Student.all
    @teachers = Teacher.all
    @program.commentable = current_user
    if @program.save
      flash[:notice] = "#{@program.name} information successsfully saved."
      redirect_to programs_path
    else
      flash[:error] = 'Program NOT successfully saved.'
      render :new
    end
  end

  def create_comment
    @program = Program.find params[:id]
    @comment = @program.comments.create comment_params
    @comment.commentable = @program
    @comment.user = current_user
    if @comment.save
      # UserMailer.comment_email(current_user, @comment).deliver
      # UserMailer.program_user_comment_email(@program, @comment).deliver
      flash[:notice] = "comment successsfully saved."
      redirect_to program_path(@program)
    else
      flash[:error] = 'comment NOT successfully saved.'
      render :new
    end

  end

  def show
    @program = Program.find params[:id]
    @students = @program.students
    @teachers = @program.teachers
    @comment = Comment.new
    authorize! :create, Comment
  end

  def edit
    @program = Program.find params[:id]
    @students = Student.all
    @teachers = Teacher.all
    authorize! :update, Program
  end

  def update
    @students = Student.all 
    @teachers = Teacher.all
    @program = Program.find params[:id]
    @program.user = current_user
    if @program.update program_params
      flash[:notice] = "#{@program.name} information successfully updated."
      redirect_to program_path(@program)
    else
      flash[:error] = 'Program NOT successfully updated.'
      render :new
    end
  end

  def destroy
    @program = Program.find params[:id]
    @program.delete
    flash[:notice] = "#{@program.name} successfully deleted."
    redirect_to programs_path
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.commentable
  end

  private

  def program_params
    params.require(:program).permit(
      :name,
      :focus,
      student_ids: [],
      teacher_ids: []
      )
  end

  def comment_params
    params.require(:comment).permit(
      :content
      )
  end


end
