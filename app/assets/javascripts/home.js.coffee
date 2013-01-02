# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  button = $('#sign_in')
  reg_no_field = $('#reg_no')
  button.addClass('disabled')
  button.attr('href','#')
  re = /10(2|3|4)(0|1)(1|0|9)(4|1)0\d\d/
  reg_no_field.keydown (e) ->
  	if reg_no_field.val().length is 9 and reg_no_field.val().match(re)
  		button.removeClass('disabled')
  		button.attr('href','/auth/facebook')
  		return
  return

disableEnterKey = (e) ->
  	key = if window.event then window.event.keyCode else e.which
  	return key != 13


