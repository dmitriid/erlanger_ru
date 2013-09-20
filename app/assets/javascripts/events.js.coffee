# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.find_route = (to) ->
  from = document.getElementById('origin').value
  dst = 'http://www.rome2rio.com/s/' + from + '/' + to + '/'
  console.log(dst)
  window.open(dst)
