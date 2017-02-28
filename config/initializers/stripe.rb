#conditional staement checking to see if rails is running in Prod, if not it uses test keys
if Rails.env.production?
  Rails.configuration.stripe = {
  	#Live keys go here
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
  	#test secret & publishable keys 
    :publishable_key => 'pk_test_Lcm5uOdW4sWxx7CG56blztXE',
    :secret_key => 'sk_test_NBrxo7BTbUvYPBD7icjSaLL3'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]