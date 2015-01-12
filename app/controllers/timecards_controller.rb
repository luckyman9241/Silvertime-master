class TimecardsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :nophases

  def nophases
    @phases = []
  end

  def create
  	@user = current_user
    card = timecard_params
    card[:date] =  Date.strptime card[:date], "%m/%d/%Y" rescue ""
    card[:crew_id] = @user.crew_id
    @timecard = current_user.timecards.build(card)
    @timecards = current_user.timecards.this_week.paginate(page: params[:page])
    if @timecard.save
  		flash[:success] = "Timecard sent!"
  		redirect_to new_timecard_path
  	else
      render 'new'
  	end
  end

  def new
    if signed_in?
      @user = current_user
      @timecard = current_user.timecards.build
      @timecards = current_user.timecards.this_week.paginate(page: params[:page])
    end
  end

  def review
    if signed_in?
      @user = current_user
      @jobs = Job.all
    end
  end

  def approve

    if @timecard.approved == false
      @timecard.approved = true
    else @timecard.approved = false
    end
    @timecard.save
    redirect_to review_path
  end

  def destroy
    @timecard.destroy
    redirect_to root_url
  end

  private

    def timecard_params
      params.require(:timecard).permit(:hours, :date, :craft_class_id, :job_id,
        :equipment_id, :phase_id)
    end

    def correct_user
      @timecard = current_user.timecards.find_by(id: params[:id])
      redirect_to root_url if @timecard.nil?
    end
end
