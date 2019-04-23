# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  searchParams = new URLSearchParams(window.location.search)

  if searchParams.has('search')
    param = searchParams.get('search')
    if param
      $('html, body').animate({
        scrollTop: $('#article-container').offset().top
      }, 1000);
