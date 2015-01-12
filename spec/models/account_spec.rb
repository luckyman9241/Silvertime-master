require 'spec_helper'

describe Account do
    before do
  	@account = Account.new(name: "Example Account")
  end

  subject  { @job }

  it { should respond_to(:name) }
end
