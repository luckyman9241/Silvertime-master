class PhasesController < ApplicationController

def index
    #binding.pry
  #respond_to do |format|
  #  format.json { render string: Job.first.phases }
  #end

  @phases = Job.find(params[:job_id]).phases.to_option
  render partial: "shared/timecard_phase_selection" 
end

def show
end

def edit
  @phase = Phase.find(params[:id])
end

def create
  @phase = Phase.new(phase_params)
  @job = Job.find(@phase.job)
  if @phase.save
    flash[:success] = "Phase saved!"
    redirect_to edit_job_path(@job)
  end
end

end

private

  def phase_params
    params.require(:phase).permit(:phase, :job_id, :number, :description)
  end
