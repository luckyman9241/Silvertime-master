require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "index" do
		let(:user) { FactoryGirl.create(:user) }
    	before(:each) do
      		sign_in user
      		visit users_path
    	end

		it { should have_title("Silvertime | All users") }
		it { should have_content("All users") }

		it "should list all users" do
			User.all.each do |user|
				expect(page).to have_selector("li", text: user.name)
			end
		end
	

		describe "pagination" do

	      before(:all) { 30.times { FactoryGirl.create(:user) } }
	      after(:all)  { User.delete_all }

	      it { should have_selector('div.pagination') }

	      it "should list each user" do
	        User.paginate(page: 1).each do |user|
	          expect(page).to have_selector('li', text: user.name)
	        end
	      end
	    end

	    describe "delete links" do

	      it { should_not have_link('delete') }

	      describe "as an admin user" do
	        let(:admin) { FactoryGirl.create(:admin) }
	        before do
	          sign_in admin
	          visit users_path
	        end

	        it { should have_link('delete', href: user_path(User.first)) }
	        it "should be able to delete another user" do
	          expect do
	            click_link('delete', match: :first)
	          end.to change(User, :count).by(-1)
	        end
	        it { should_not have_link('delete', href: user_path(admin)) }
	      end
	    end
	end

	describe "signup page" do
	    before { visit signup_path }

	    let(:signup) { "Create new user" }

	    it { should have_content('Sign up new user') }
	    it { should have_title('Silvertime | Sign up') }

	    describe "fill in form with valid info" do
		    before do
			    fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
		    end

		    it "should create one user" do
		    	expect { click_button signup }.to change(User,	 :count).by(1)
		    end

		    describe "after saving the user" do
        		before { click_button signup }
        		let(:user) { User.find_by(email: 'user@example.com') }

		        it { should have_link('Sign out') }
		        it { should have_selector('div.alert.alert-success', text: 'Successfully saved new user!') }
      		end
		end

		describe "fill in form with invalid info" do
			it  "should not not save user" do
		    	expect { click_button signup }.not_to change(User, :count)
		    end
	  	end
	end

  	describe "profile page" do
	  let(:user) { FactoryGirl.create(:user) }
	  let!(:t1) { FactoryGirl.create(:timecard, user: user, hours: 8, date: 1.day.ago) }
	  let!(:t2) { FactoryGirl.create(:timecard, user: user, hours: 8, date: 2.days.ago) }

	  before { visit user_path(user) }

	  it { should have_content(user.name) }

	  describe "timecards" do
	  	it { should have_content(t1.hours) }
	  	it { should have_content(t2.hours) }
	  	it { should have_content(user.timecards.count) }
	  end
	end

	describe "edit page" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Edit your information") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should	have_content('error') }
		end

		describe "with valid information" do
	      let(:new_name)  { "New Name" }
	      let(:new_email) { "new@example.com" }
	      	before do
		        fill_in "Name",             with: new_name
		        fill_in "Email",            with: new_email
		        fill_in "Password",         with: user.password
		        fill_in "Confirm Password", with: user.password
		        click_button "Save changes"
      		end

			it { should have_title(new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.name).to  eq new_name }
			specify { expect(user.reload.email).to eq new_email }
    	end
	end




end