class StudentSubjectsController < ApplicationController
  def new
    @subject = Subject.find(params[:subject_id])
    @student_subject = StudentSubject.new
  end

  def create
    @student_subject = StudentSubject.new(student_subjects_params)
    @student_subject.subject_id = params[:subject_id]
    if @student_subject.save
      redirect_to "/subjects/#{params[:subject_id]}"
      flash[:notice] = "Student added!"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Student_Subject creation failed"
    end
  end

  private
  def student_subjects_params
    params.require(:student_subject).permit( :student_id )
  end
end