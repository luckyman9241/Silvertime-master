class Timecard < ActiveRecord::Base
	belongs_to :user
	belongs_to :crew
	default_scope -> { order('created_at DESC') }
	validates :hours, numericality: { less_than_or_equal_to: 24 }
	validates_presence_of(:crew_id, :job_id, :date, :user_id, :phase_id)

	class << self
		def this_week
			where(date: Date.today.beginning_of_week..Date.today.end_of_week)
		end
	end

end
