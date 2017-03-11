# Be sure to restart your server when you modify this file. 
# Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # if subscribed, users are streaming the updates
    #paired with alert code in app/views/products/show.html.erb
    #stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #method to stop all and listen only for curr prod stream,
  #this is called in product.js
  def listen(data)
  	stop_all_streams
  	stream_for data["product_id"]
  end

end
