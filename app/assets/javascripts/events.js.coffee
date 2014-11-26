# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# hides category dropdown on new event form until a theme has been selected
jQuery ->
  $('#event_category_id').parent().hide()
  categories = $('#event_category_id').html()
  $('#event_theme_id').change ->
    theme = $('#event_theme_id :selected').text()
    escaped_theme = theme.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(categories).filter("optgroup[label='#{escaped_theme}']").html()
    if options
      $('#event_category_id').html(options)
      $('#event_category_id').parent().show()
    else
      $('#event_category_id').empty()
      $('#event_category_id').parent().hide()


    

