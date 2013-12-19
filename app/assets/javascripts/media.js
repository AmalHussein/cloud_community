
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
	youtubeIframe = '<iframe width="525" height="400" 
src="//www.youtube.com/embed/<%= video.unique_id %>" 
frameborder="0" allowfullscreen></iframe>';
$('#iframe-container').html(youtubeIframe);
});
});

