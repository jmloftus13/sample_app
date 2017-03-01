class PaymentsController < ApplicationController
	#User Authentication first
  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    #tying @product to the hidden parameter in show.html.erb
    @product = Product.find(params[:product_id])
    @user = current_user
    
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      	) #end charge.create block

      if charge.paid
      	#this creates details of a paid order
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        ) #end of the Order.create block
        flash[:notice] = "Payment processed successfully"
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    #redirect user to the products page, 
    #later test a redirect to create.html.erb
    redirect_to product_path(@product)
  end
end
