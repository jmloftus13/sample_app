//Channel Client-Side
//function subscribes a user to a specific channel and assigns it to the
//variable App.product. This makes the curr subscription available through App.product.
//executing the line creats the subscription
//subscribe method in app/channels/product_channel.rb is called.
//this tells the server that a new subscriber is connected.
App.product = App.cable.subscriptions.create({channnel: "ProductChannel"}, {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    //code in the lesson does not have the word 'data' in the above function. problem?
    //this shows the alert coded in show.html.erb
    $(".alert.alert-info").show();
    $('.product-reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
    //console.log(data);
  },

  listen_to_comments: function() {
    return this.perform('listen', {
        product_id: $("[data-product-id]").data("product-id")
    });
  }

});

// ensures listen-to_comments is called every time user loads a new page
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();

});

