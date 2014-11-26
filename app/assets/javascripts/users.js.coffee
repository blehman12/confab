# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

HideContent = (d) ->
  document.getElementById(d).style.display = "none"
  return
ShowContent = (d) ->
  document.getElementById(d).style.display = "block"
  return
ReverseDisplay = (d) ->
  if document.getElementById(d).style.display is "none"
    document.getElementById(d).style.display = "block"
  else
    document.getElementById(d).style.display = "none"
  return
HideAllShowOne = (d) ->
  IDvaluesOfEachDiv = "userwants userskills usercomm userevents"
  
  #-------------------------------------------------------------
  IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/[,\s"']/g, " ")
  IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/^\s*/, "")
  IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(/\s*$/, "")
  IDvaluesOfEachDiv = IDvaluesOfEachDiv.replace(RegExp("  +", "g"), " ")
  IDlist = IDvaluesOfEachDiv.split(" ")
  i = 0

  while i < IDlist.length
    HideContent IDlist[i]
    i++
  ShowContent d
  return