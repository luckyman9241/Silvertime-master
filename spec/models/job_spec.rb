require 'spec_helper'

describe Job do
  before do
  	@job = Job.new(number: 14001, description: "Strawberry Fields", account_id: 1, active: true)
    @job = Job.new(number: 14001, description: "Blueberry House", account_id: 2, active: true)
  end

  subject  { @job }

  it { should respond_to(:number) }
  it { should respond_to(:description) }
  it { should respond_to(:account_id) }

  describe "with account_id set to 1" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
end
