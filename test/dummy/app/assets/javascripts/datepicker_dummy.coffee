$ ->
	format= 'dd-mm-yyyy'

	startDate=
		if $(document).find('.example').data('start')
			new Date( Date.parse( $(document).find('.example').data('start').replace(/\"/gm, "") ) )
		else
			null
		

	endDate=
		if $(document).find('.example').data('end')
			new Date( Date.parse( $(document).find('.example').data('end').replace(/\"/gm, "") ) )
		else
			null

	defaultDate=
		if d = $(document).find('.myDate').data('defaultdate')
			date = new Date( Date.parse( d.replace(/\"/gm, "") ) )
			# console.log date
			# $(document).find('.myDate').set_date(date)

		# else
		# 	null
		# 	console.log 'date'
		# 	date

		


	datePickerOptions =
	  format: format
	  weekStart: 1
	  # calendarWeeks: true
	  autoclose: true
	  language: 'nl'
	  showWeek: true,
	  inline: true,
	  showOtherMonths: true,
	  # todayBtn: 'linked'
	  # todayHighlight: true
	  closeButton: false,
	  showOtherMonths: true,
	  dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
	  # leftArrow:'LLLLLLLL'
	  # rightArrow:'RRRRRRR',
	  # currentText: "Now",
	  # showMonthAfterYear: true

	  # console.log 'rolf',

	  # viewMode: 2
	  # startView: 2
	  # initialDate: '01/01/2001'
	  initialDate: defaultDate#new Date( Date.parse( $(document).find('.setDagKaartenDate').data('start').replace(/\"/gm, "") ) )
	  # initialDate: new Date( Date.parse( $(document).find('.setDagKaartenDate').data('start').replace(/\"/gm, "") ) )
	  # startDate: startDate
	  # endDate: endDate
	

	$( ".myDate" ).datepicker(datePickerOptions)

	window.datePickerOptions = datePickerOptions
