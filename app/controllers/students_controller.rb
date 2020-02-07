class StudentsController < ApplicationController
    def index
      @students = Student.all
    end
    def show
      @student = Student.find(params[:id])
    end
    def new
      @student = Student.new
    end
    def create
      student = Student.create(student_params)
      
      redirect_to "/student/#{student.id}" or redirect_to student
    end
    def edit
      @student = Student.find(params[:id])
    end
    def update
      @student = Student.find(params[:id])
      @student.update(student_params)
      
      redirect_to student
    end
    
    def destroy
      Student.find(params[:id]).destroy
      
      redirect_to students_path
    end
    next method is to help us defend from some hacks:
    private
    def student_params
      params.require(:student).permit(:name, :price, :pic)
    end
  end
  