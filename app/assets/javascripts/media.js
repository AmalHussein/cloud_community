
$(document).ready(function() {

	$('.song-link').click(function(event){
		var iframeMarkup;
		event.preventDefault();
		iframeMarkup = $('.song-link').data('iframe-markup');
		$('#iframe-container').html(iframeMarkup);
	
	});

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

				// ADDING IN ANOTHER HANDLER INSIDER AJAX CALL 
				$('#new-link').click(function(event) {
					event.preventDefault();
					
				});


				}
			});

	});

	$('.audio-links').hide();

	$('#soundcloud').click(function(event){
		event.preventDefault();
		$('.video-links').hide();
		$('.audio-links').show();
	});

	$('#youtube').click(function(event){
		event.preventDefault();
		$('.audio-links').hide();
		$('.video-links').show();	
	});



});
