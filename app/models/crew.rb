class Crew < ActiveRecord::Base
	has_many :users
	has_many :timecards
	validates :name, presence: true
end
