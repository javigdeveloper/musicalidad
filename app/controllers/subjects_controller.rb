class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end
  def show
    @subject = Subject.find(params[:id])
  end
  def new
    @subject = Subject.new
  end
  def edit
    @subject = Subject.find(params[:id])
  end
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to @subject
      flash[:notice] = "Subject created!"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Subject creation failed"
    end
  end
  def update
    @subject = Subject.find(params[:id])
    @subject.update(subject_params)
    
    redirect_to @subject
  end
  
  def destroy
    Student.find(params[:id]).destroy
    
    redirect_to students_path
  end
  private
  def subject_params
    params.require(:subject).permit(:name, :student_id, :teacher_id, :time, :room, :room_limit )
  end
end