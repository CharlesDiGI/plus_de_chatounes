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
//= require core/jquery.3.2.1.min
//= require core/bootstrap.min
//= require core/popper.min

//= require plugins/moment.min
//= require plugins/bootstrap-datetimepicker.min
//= require plugins/bootstrap-selectpicker
//= require plugins/bootstrap-switch
//= require plugins/bootstrap-tagsinput
//= require plugins/jasny-bootstrap.min
//= require plugins/nouislider.min

//= require now-ui-kit
//= require_tree .

function slideIndex() {
	$(document).ready(function(){
		let target = $('#img-ancre');
		$('html, body').stop().animate({scrollTop: $(target).offset().top}, 1000 );
	});
}