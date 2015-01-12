class Phase < ActiveRecord::Base
  belongs_to :job

def to_s
  "#{number} #{description}"
end

class << self

  def to_option
    all.collect { |phase| [phase.to_s, phase.id] }
  end

end


end
