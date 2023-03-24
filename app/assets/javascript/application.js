// (document).on("ajax:success", function() {
//   const tag = document.createElement('script');
//   tag.src = "https://www.youtube.com/player_api";
//   const firstScriptTag = document.getElementsByTagName('script')[0];
//   firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
// });


//IFrame Player APIを呼び出す
  const tag = document.createElement('script');
  tag.src = "https://www.youtube.com/player_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

//プレーヤーの準備
	var ytNum = 0;
	let thumbInsert = '';
	let ytPlayer;
	let ytData = [
	  //{ youtubeのID, 開始時間(秒), 終了時間(秒) },
	  <% @clips.each do |clip| %>
	    { id: '<%= clip.video_id %>', start: '<%= clip.start_time %>', end: '<%= clip.end_time %>' },
	  <% end %>
	];

// 動画プレーヤーの読み込み
// 	window.onYouTubeIframeAPIReady = function() {
	function onYouTubeIframeAPIReady() {
    ytPlayer = new YT.Player('movie-play', {
      width: '100%',
      height: '100%',
      videoId: ytData[0]['id'],
			playerVars:{
				rel: 0, //関連動画なし
				modestbranding: 1, //YouTube ロゴなし
				start: ytData[0]['start'],
				end: ytData[0]['end'],
			},
			events: { /* イベント */
        'onReady': onPlayerReady,   /* プレーヤの準備完了時 */
        'onStateChange': onPlayerStateChange   /* 動画プレーヤーのステータス変更 */
      }
    });
    spotArea(ytNum);
  }
	//動画の再生
	function onPlayerReady(event) {
    event.target.playVideo();
  }
	function play(ytNum) {
		ytPlayer.loadVideoById({
			'videoId': ytData[ytNum]['id'],
      'startSeconds': ytData[ytNum]['start'],
      'endSeconds': ytData[ytNum]['end'],
      'suggestedQuality': 'medium',
			'rel': 0, //関連動画なし
			'modestbranding': 1,
		});
		spotArea(ytNum);
	}

//リストクリック
	$(function() {
	  /* 指定した動画を再生 */
		$('#movie-menu .playlist_clip').on('click', function() {
			ytNum = $('#movie-menu .playlist_clip').index(this)
				console.log(ytNum);
				console.log(ytData[ytNum]['id']);
		// 	spotArea(ytNum);
			play(ytNum);
			return false;
		});
	});

// 連続再生
	function onPlayerStateChange(event) {
		if ($('#continuous_playback').parent().hasClass('active')) {
				console.log(event);
			playback(event);
			if (event.data == YT.PlayerState.ENDED) { //ENDED == 0
				if (playlog == 11) {
					playlog = 22;
					ytNum = parseInt(ytNum) + 1;
						console.log(playlog);
						console.log(ytNum);
				// 	spotArea(ytNum)
					play(ytNum);
				}
			}
		} else if ($('#shuffle_playback').parent().hasClass('active')) {
			console.log(event);
			playback(event);
			if (event.data == YT.PlayerState.ENDED) {
				if (playlog == 11) {
					ytNum = Math.floor( Math.random() * ytData.length );
					playlog = 22;
						console.log(playlog);
						console.log(ytNum);
				// 	spotArea(ytNum)
					play(ytNum);
				}
			}
		}
	}

	function playback(event) {
		if (event.data == 1) {
			playlog = 11;
			console.log(playlog);
		}
	}

  function spotArea(ytNum) {
    console.log(ytNum);
    ytNum = parseInt(ytNum);
    $('.playlist_clip').removeClass('bg-secondary');
    $('.playlist_clip').eq(ytNum).addClass('bg-secondary');
  }

  document.addEventListener('ajax:success', function() {
    const tag = document.createElement('script');
    tag.src = "https://www.youtube.com/player_api";
    const firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  });

	//   //初回読み込み、リロード、ページ切り替えで動く。
	// $(document).on('turbolinks:load', function() { });

	// //初回読み込み、ページ切り替えで動く。リロードは動かない
	// $(document).on('turbolinks:render', function() {　});

	// //ページ遷移前に行いたい処理用。ページ切り替えでもリロードでも動かない
	// $(document).on('turbolinks:request-start', function() {　});avascripts/script.js


	// $(document).on('turbolinks:load', function() {
	//   // IFrame Player API の初期化コードをここに記述
	// });