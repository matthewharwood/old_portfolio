# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


window.onload = ->
  $('.meny-control li:first-child').addClass('active')

$(document).ready ->
  createModal = ->
   $("body").fadeOut "slow"
   
  $(".enter").on
    click: ->
      createModal()

