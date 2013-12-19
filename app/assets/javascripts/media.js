
// $(document).ready(function(){

// 	$('.song-link').each(function(songLinkEl){
// 		songLinkEl.on('click', function(event){ 
// 			event.preventDefault();

// 		 var iframeMarkup = songLinkEl.data('iframe-markup');
// 		 $('#iframe-container').html(iframeMarkup);
// 		});
// 	}
// })


$(document).ready(function() {

	$('.song-link').click(function(event){
		var iframeMarkup;
		event.preventDefault();
		iframeMarkup = $('.song-link').data('iframe-markup');
		$('#iframe-container').html(iframeMarkup);
	});

});

