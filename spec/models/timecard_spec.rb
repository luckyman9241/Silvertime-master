require 'spec_helper'

describe Timecard do
  let(:crew) { FactoryGirl.create(:crew) }
  let(:user) { FactoryGirl.create(:user) }
  before { @timecard = user.timecards.build(hours: 12, date: 1.day.ago, crew: crew) }

  subject { @timecard }

  it { should respond_to(:pay_period_end_date) }
  it { should respond_to(:date) }
  it { should respond_to(:user_id) }
  it { should respond_to(:job_id) }
  it { should respond_to(:phase_id) }
  it { should respond_to(:equipment_id) }
  it { should respond_to(:tax_state) }
  it { should respond_to(:unemployment_state) }
  it { should respond_to(:insurance_state) }
  it { should respond_to(:insurance_code) }
  it { should respond_to(:certified_payroll) }
  it { should respond_to(:craft_id) }
  it { should respond_to(:craft_class_id) }
  it { should respond_to(:earnings_type_id) }
  it { should respond_to(:hours) }
  it { should respond_to(:wage) }
  it { should respond_to(:amount) }
  it { should respond_to(:notes) }

  #test associations
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should respond_to(:crew) }
  its(:crew) { should eq crew }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @timecard.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when date is not present" do
  	before { @timecard.date = nil }
  	it { should_not be_valid }
  end

  describe "when hours are greater than 24" do
  	before { @timecard.hours = 25 }
  	it { should_not be_valid }
  end
end
