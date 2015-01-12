require 'spec_helper'

describe Crew do
  before { @crew = Crew.new(name: "Alpha") }

  let(:crew_member) { FactoryGirl.create(:user) }
  
  subject { @crew }

  it { should respond_to(:name) }

  #Associations
  it { should respond_to(:users) }
  it { should respond_to(:timecards) }

  it { should be_valid }

end
