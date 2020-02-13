class StudentSubjectsController < ApplicationController
  def new
    @subject = Subject.find(params[:subject_id])
    @student_subject = StudentSubject.new
  end

  def create
    @student_subject = StudentSubject.new(student_subjects_params)
    @student_subject.subject_id = params[:subject_id] if params[:subject_id]
    @student_subject.student_id = params[:student_id] if params[:student_id]
    subject = Subject.find(params[:subject_id] || params[:student_subject][:subject_id])
    if subject.students.length < subject.room_limit
      @student_subject.save
      if @student_subject.save
        redirect_to "/subjects/#{subject.id}"
        flash[:notice] = "Student added!"
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Imposible añadir estudiante, es posible que la clase esté llena."
    end
  end


  def destroy
    StudentSubject.find_by(student_id: params[:student_id], subject_id: params[:subject_id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private
  def student_subjects_params
    params.require(:student_subject).permit( :student_id, :subject_id )
  end
end