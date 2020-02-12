class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end
  def show
    @teacher = Teacher.find(params[:id])
  end
  def new
    @teacher = Teacher.new
  end
  def edit
    @teacher = Teacher.find(params[:id])
  end
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    redirect_to @teacher
  end
  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    
    redirect_to @teacher
  end
  
  def destroy
    Teacher.find(params[:id]).destroy
    
    redirect_to teachers_path
  end
  private
  def teacher_params
    params.require(:teacher).permit(:name, :pic)
  end
end  