$(document).ready(function(){

	$('.delete-comment').on('ajax:complete', function(e){
		$(e.currentTarget).parent().hide();
	});

});