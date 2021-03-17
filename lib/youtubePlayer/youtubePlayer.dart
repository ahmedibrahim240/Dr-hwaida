import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutYubeVidoPlayer extends StatefulWidget {
  final videoUrl;

  const YoutYubeVidoPlayer({Key key, @required this.videoUrl})
      : super(key: key);
  @override
  _YoutYubeVidoPlayerState createState() => _YoutYubeVidoPlayerState();
}

class _YoutYubeVidoPlayerState extends State<YoutYubeVidoPlayer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  // PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  // double _volume = 100;
  // bool _muted = false;
  // ignore: unused_field
  bool _isPlayerReady = false;
  String url = "https://www.youtube.com/watch?v=H9154xIoYTA";
  String id;

  // final List<String> _ids = [
  //   'nPt8bK2gbaU',
  //   'gQDByCdjUXw',
  //   'iLnmTe5Q2Qw',
  //   '_WoCV4c6XOE',
  //   'KmzdUe0RSJo',
  //   '6jZDSSZZxjQ',
  //   'p2lYr3vM_1w',
  //   '7QUtEmBT_-w',
  //   '34_PXCzGw1M',
  // ];

  @override
  void initState() {
    super.initState();
    id = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  void listener() {
    setState(() {
      // _playerState = _controller.value.playerState;
      _videoMetaData = _controller.metadata;
    });

    // if (_isPlayerReady && mounted && _controller.value.isFullScreen) {
    //   setState(() {
    //     // _playerState = _controller.value.playerState;
    //     _videoMetaData = _controller.metadata;
    //   });
    // }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        //   onEnded: (data) {
        //     _controller
        //         .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
        //     _showSnackBar('Next Video Started!');
        //   },
      ),
      builder: (context, player) => Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  _text('Title', _videoMetaData.title),
                  _space,

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(Icons.skip_previous),
                  //       onPressed: _isPlayerReady
                  //           ? () => _controller.load(_ids[
                  //               (_ids.indexOf(_controller.metadata.videoId) -
                  //                       1) %
                  //                   _ids.length])
                  //           : null,
                  //     ),
                  //     IconButton(
                  //       icon: Icon(
                  //         _controller.value.isPlaying
                  //             ? Icons.pause
                  //             : Icons.play_arrow,
                  //       ),
                  //       onPressed: _isPlayerReady
                  //           ? () {
                  //               _controller.value.isPlaying
                  //                   ? _controller.pause()
                  //                   : _controller.play();
                  //               setState(() {});
                  //             }
                  //           : null,
                  //     ),
                  //     IconButton(
                  //       icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                  //       onPressed: _isPlayerReady
                  //           ? () {
                  //               _muted
                  //                   ? _controller.unMute()
                  //                   : _controller.mute();
                  //               setState(() {
                  //                 _muted = !_muted;
                  //               });
                  //             }
                  //           : null,
                  //     ),
                  //     FullScreenButton(
                  //       controller: _controller,
                  //       color: Colors.blueAccent,
                  //     ),
                  //     IconButton(
                  //       icon: const Icon(Icons.skip_next),
                  //       onPressed: _isPlayerReady
                  //           ? () => _controller.load(_ids[
                  //               (_ids.indexOf(_controller.metadata.videoId) +
                  //                       1) %
                  //                   _ids.length])
                  //           : null,
                  //     ),
                  //   ],
                  // ),
                  // _space,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
