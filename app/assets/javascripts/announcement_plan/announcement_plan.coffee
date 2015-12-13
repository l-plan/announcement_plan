class Announcements
	constructor: () ->
		@announcements = @getAnnouncements()#.responseJSON #.responseJSON
		# @getAnnouncements()

	notify: (data) ->
		for d in data.responseJSON#.reverse()
			new Announcement(d).renderAnnouncement()


	getAnnouncements: ->
		$.ajax "/announcement_plan/announcements.json",
			dataType: "JSON",
			method: "GET",
			complete: @notify
			# complete: @announcements #= @responseJSON

	# announcements: (data) ->
	# 	JSON.parse data#.responseJSON

class Announcement
	constructor: (ann) ->
		@id = ann.id#.toString()#@getAnnouncement(announcement)
		@tekst = ann.tekst
		@title = ann.title
		@color = ann.category_color
		@start = ann.start_announcing_at
		@stop =  ann.stop_announcing_at


	renderAnnouncement: () ->
		str = ""
		str += "<div class='postit' style='background-color: #{@color}' data-id='#{@id}' data-naam='rolf'>"
		str += "<a class='postit_close'>&#215;</a>"
		str += "<div class= 'postit_title'>#{@title}</div>"
		str += "<div class= 'postit_tekst'>#{@tekst}</div>"
		str += "</div>"


		$("#announcements").append str

	markAsRead: () ->
		$.ajax "/announcement_plan/recipients",
		dataType: "JSON",
		method: "POST",
		data: {recipient: { announcement_id: @id } }    



$ ->
  new Announcements()

setInterval ->
    $ ->
      new Announcements()
  , 60000


$ ->
  $(document).on 'click', '.postit_close', ()  ->
  	new Announcement( @.closest('.postit').dataset ).markAsRead()
  	$(this).closest('.postit').remove()




$ ->
  $('.mijnDatumInput').fdatepicker(format: 'dd-mm-yyyy,', weekStart: 1)


root = exports ? window
root.Announcements = Announcements
root.Announcement = Announcement