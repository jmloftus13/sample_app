require 'rails_helper'

describe Product do

	#testing context
	context "when the product has comments" do

		before do #run this before the context
			#this code generates test content; product name & ratings.
		    @product = Product.create!(name: "race bike")
		    @user = User.create!(email: "julie@abc.com", password: "password")
		    @product.comments.create!(rating: 1, user: @user, body: "terrible")
			@product.comments.create!(rating: 3, user: @user, body: "average")
			@product.comments.create!(rating: 5, user: @user, body: "excellent")
		end #end before do

		#test for average rating base on above data
		it "returns the average rating of all comments" do
	    expect(@product.average_rating).to eq 3
	  	end #end average rating it block

	end #end context block

	#validations test
	it "is not valid" do
	   expect(Product.new(description: "Nice bike")).not_to be_valid
	  end #end validation test

end #end Product describe block