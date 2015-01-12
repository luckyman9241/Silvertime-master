require 'spec_helper'

describe "Crew pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	let(:crew) { FactoryGirl.create(:crew) }
	before { sign_in user }

	describe "crew creation" do
		before { visit new_crew_path }

		describe "with invalid information" do
			it "should not create a crew" do
				expect { click_button "Create Crew" }.not_to change(Crew, :count)
			end

			describe "error messages" do
				before { click_button "Create Crew" }
				it { should have_content "error" }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Alpha"
			end

			it "should create a crew" do
				expect { click_button "Create Crew" }.to change(Crew, :count)
			end
		end
	end
end