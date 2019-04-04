// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery



	$(function() {
		$(document).on('click', '.button', function() {
			$('.sign_modal_wrapper').css('display', 'block');
			$('.sign_modal').fadeIn(500);
			if ($(this).hasClass('sign_up_button')) {
				$('.sign_modal_up').fadeIn(500);
			} else {
				$('.sign_modal_in').fadeIn(500);
			}
		})

	$('.sign_modal_wrapper').click(function(e) {
		if (!$(e.target).closest('.sign_modal').length) {
			$('.sign_modal_wrapper').fadeOut(500);
			$('.sign_modal').fadeOut(500);
			$('.sign_modal_up').fadeOut(500);
			$('.sign_modal_in').fadeOut(500);
		}
	})
	})
