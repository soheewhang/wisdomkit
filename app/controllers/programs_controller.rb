class ProgramsController < ApplicationController
  
  def index
    @programs = Program.all
  end
  
  def new
    @program = Program.new
  end
  
  def create
    @program = Program.new(params[:program])
    if @program.save
      redirect_to program_path(@program)
    else
    end
  end
  
  def show
    @program = Program.find(params[:id])
  end
  
end
