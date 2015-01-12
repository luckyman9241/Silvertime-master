class JobsController < ApplicationController

  def index
    @active_jobs = Job.all.where("active = ? AND account_id = ?", true, current_account)
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.account_id = current_account.id
    if @job.save
      flash[:success] = "Job saved!"
      redirect_to @job
    else
      render 'new'
    end
  end

  def new
    @job = Job.new
    @job.account_id = current_account.id
  end

  def edit
    @job = Job.find(params[:id])
    @phases = @job.phases
    @phase = Phase.new
  end

  def update
  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:number, :description, :state, :payroll_state)
    end

    def current_account
      Account.find(current_user.account_id)
    end
end
