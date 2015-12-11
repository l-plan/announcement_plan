class Announcement
	constructor: (user) ->
		@notify()
	# @renderAnnouncements()



	notify: ->
		$.ajax(
			url: "/announcement_plan/announcements.json"
			dataType: "JSON"
			method: "GET"
			succes: @renderAnnouncements(@data)
			)

	renderAnnouncements: (data) =>
		console.log data



$ ->
	new Announcement()





$ ->
  $('.mijnDatumInput').fdatepicker(format: 'dd-mm-yyyy,', weekStart: 1)