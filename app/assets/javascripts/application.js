// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require countdown
//= require_tree .

$(document).ready(function(){
  var quantity, amount, price, description;

  var key = $('#customButton').data('key');

  var handler = StripeCheckout.configure({
    key: key,
    image: '/square-image.png',
    token: function(token, args) {
      // Use the token to create the charge with a server-side script.
      var tokenInput = $("<input type=hidden name=stripeToken />").val(token.id);
      var emailInput = $("<input type=hidden name=stripeEmail />").val(token.email);
      console.log(token.id, token.email);
      $("#new_ticket").append(tokenInput).append(emailInput).submit();
    }
  });

  $('#customButton').on('click', function(e) {
    quantity = parseInt($('#ticket_number').val());
    amount = quantity * 800;
    price = quantity * 8;
    description = quantity + ' tickets at $' + price;

    // Open Checkout with further options
    handler.open({
      name: 'TRYST',
      description: description,
      amount: amount
    });
    e.preventDefault();
  });


});

 