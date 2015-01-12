class CrewsController < ApplicationController
	def index
	end

	def show
		@crew = Crew.find(params[:id])
	end

	def new
		@crew = Crew.new
	end

	def create
		@crew = Crew.new(crew_params)
    	if @crew.save
      		flash[:success] = "Successfully saved new crew!"
      		redirect_to @crew
    	else
     		render 'new'
    	end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	    def crew_params
	      params.require(:crew).permit(:name)
	    end

end
