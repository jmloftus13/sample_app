require "rails_helper"

describe User, :type => :model do

	# start the it block (actual test)
    it "orders by last name" do
    mouse = User.create!(first_name: "mickey", last_name: "mouse", email: "mickeymouse@xyz.com", password: "password", password_confirmation: "password")
    duck = User.create!(first_name: "donald", last_name: "duck", email: "donalduck@xyz.com", password: "password", password_confirmation: "password")
    	
    	#expected result of the text
	    expect(User.all.order("last_name")).to eq([duck, mouse])
  	end #end the it block

end #end desribe block