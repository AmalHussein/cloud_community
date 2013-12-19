
$(document).ready(function(){

	$('.song-link').each(function(songLinkEl){
		songLinkEl.on('click', function(evt){
		 var iframeMarkup = songLinkEl.data('iframe-markup');
		 $('#iframe-container').html(iframeMarkup);
		 // not sure of syntax preventDefault();
		});
	}
})