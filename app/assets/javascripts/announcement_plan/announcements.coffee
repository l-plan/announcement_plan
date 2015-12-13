jQuery ->
  $(document).on 'click', '.toggleTarget', ()  ->
  	console.log 'rolf'
  	$(this).closest('.select_target').find('.targets').toggle()