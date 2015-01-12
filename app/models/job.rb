class Job < ActiveRecord::Base
	belongs_to :account
	has_many :phases

	default_scope {where(active: true)}

	def to_s
		"#{number} #{description}"
	end

	class << self

		def to_option
			all.collect { |job| [job.to_s, job.id] }
		end

	end

end
