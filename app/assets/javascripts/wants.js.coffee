# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#want_category_id').parent().hide()
  categories = $('#want_category_id').html()
  $('#want_theme_id').change ->
    theme = $('#want_theme_id :selected').text()
    escaped_theme = theme.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(categories).filter("optgroup[label='#{escaped_theme}']").html()
    if options
      $('#want_category_id').html(options)
      $('#want_category_id').parent().show()
    else
      $('#want_category_id').empty()
      $('#want_category_id').parent().hide()