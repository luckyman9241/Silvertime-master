require 'spec_helper'

describe "TimecardPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "timecard creation" do
    before { visit new_timecard_path }

    describe "with invalid information" do

      it "should not create a timecard" do
        expect { click_button "Get Paid!" }.not_to change(Timecard, :count)
      end

      describe "error messages" do
        before { click_button "Get Paid!" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
      	fill_in 'timecard_hours', with: 8
      	fill_in 'timecard_date', with: 1.day.ago
      end

      it "should create a timecard" do
        expect { click_button "Get Paid!" }.to change(Timecard, :count).by(1)
      end
    end
  end
end
