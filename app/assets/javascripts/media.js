
$(document).ready(function() {

	$('.song-link').click(function(event){
		var iframeMarkup;
		event.preventDefault();
		iframeMarkup = $('.song-link').data('iframe-markup');
		$('#iframe-container').html(iframeMarkup);
	});

	$('.video-link').click(function(event){
		var youtubeIframe;
		event.preventDefault();
		youtubeIframe =$('.video-link').html(youtubeIframe);
	});
});
