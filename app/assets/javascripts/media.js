
// On load
$(document).ready(function() {

	$('.song-link').click(function(event){
		var iframeMarkup;
		event.preventDefault();
		iframeMarkup = $('.song-link').data('iframe-markup');
		$('#iframe-container').html(iframeMarkup);
	
	});
// Video Links Event Handler & Commments Ajax Call 
	$('.video-link').click(function(event){
		var youtubeIframe, videoURL;
		event.preventDefault();
		youtubeIframe = $(this).data('youtube-iframe');
		$('#iframe-container').html(youtubeIframe);

		videoURL = $(this).data('path');

			$.ajax({
				url: videoURL, 
				dataType: 'html', 
				success: function(data){
			$('#comments').html(data);
				}
			});

	});

	// Hiding the SoundCloud links since default is YouTube
	$('.audio-links').hide();

// Hiding YouTube links when SoundCloud Tab is clicked
	$('#soundcloud').click(function(event){
		event.preventDefault();
		$('.video-links').hide();
		$('.audio-links').show();
	});

// Hiding SoundCloud links when YouTube tab is clicked
	$('#youtube').click(function(event){
		event.preventDefault();
		$('.audio-links').hide();
		$('.video-links').show();	
	});



});
