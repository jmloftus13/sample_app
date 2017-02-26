require 'rails_helper'

#functional test on Users controller using same class as in app/controllers/users_controller file
describe UsersController, :type => :controller do

	before do
		@user = User.create!(first_name: "mickey", last_name: "mouse", email: "mickeymouse@xyz.com", password: "password", password_confirmation: "password")
		@user2 = User.create!(first_name: "donald", last_name: "duck", email: "donalduck@xyz.com", password: "password", password_confirmation: "password")

	end #end before do that established users

	#everything here will happen in the SHOW action
	describe 'GET #show' do

		#testing for user is logged in
	    context 'User is logged in' do 
		  	before do #before that sign the user in
	        	sign_in @user
	        end #end before do for sign-in

	        #tests for correct details
			it 'loads correct user details' do
				get :show, params:{id: @user.id}
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end #end load correct details

			#tests that it does not load incorrect details ie. details for user2
			it 'does not load other user details' do
				#get the show page of the current user
				get :show, params:{id: @user2.id}
				expect(response).to have_http_status(302)
				#instead redirects to the root_path
				expect(response).to redirect_to(root_path)
			end #end

	    end #end user logged in context

	    #testing for no user is logged in
	    context 'No user is logged in' do 

	    	it 'redirects to login' do
	    		get :show, params:{id: @user.id}
				expect(response).to redirect_to(new_user_session_path)
	    	end #end the it block redirecting to login
	    
	    end #end No user logged in context block

	end #end describe block GET show
end #end describe block for UsersController