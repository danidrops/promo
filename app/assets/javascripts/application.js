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
    }
  });

  $('#customButton').on('click', function(e) {
    quantity = parseInt($('#ticket_number').val());
    amount = quantity * 1000;
    price = quantity * 10;
    description = quantity + ' tickets at $' + price;

    // Open Checkout with further options
    handler.open({
      name: 'TRYST',
      description: description,
      amount: amount
    });
    e.preventDefault();
  });

  updateCountdown();
});


function updateCountdown() {
    $("#countdown").html(countdown( null, new Date(2014, 2, 7), countdown.DAYS | countdown.HOURS | countdown.MINUTES | countdown.SECONDS).toString());
    setInterval(updateCountdown, 1000);
  }

