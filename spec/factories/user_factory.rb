FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	#don't need to specify the class
	#FactoryGirl guesses the User model when we call the factory :user
	factory :user do	
		email
	    password "password"
	    first_name "Mickey"
	    last_name "Mouse"
	    admin false
	end 

	#uses the User class rather than Admin
	factory :admin, class: User do
	  email
	  password "qwertyuiop"
	  admin true
	  first_name "Admin"
	  last_name "User"
	end

end #no factories outside this block