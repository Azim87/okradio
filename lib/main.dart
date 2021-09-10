import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';

import 'assets.dart';
import 'colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // navigation bar color
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ok radio',
      theme: ThemeData.light(),
      home: AudioServiceWidget(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  pause() => AudioService.pause();

  play() async {
    try {
      await AudioService.start(
        backgroundTaskEntrypoint: _backgroundTaskEntrypoint,
      );
      if (AudioService.running) {
        AudioService.play();
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  @override
  void dispose() {
    AudioService?.stop();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Жок'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  AudioService.stop();
                },
                child: Text('Ооба'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: SvgPicture.asset(Assets.app_logo),
            ),
            StreamBuilder<AudioProcessingState>(
                stream: AudioService.playbackStateStream
                    .map((event) => event.processingState)
                    .distinct(),
                builder: (context, snapshot) {
                  final processingState =
                      snapshot.data ?? AudioProcessingState.none;
                  if (processingState == AudioProcessingState.connecting) {
                    Fluttertoast.showToast(
                        msg: "Подключение к потоку...",
                        backgroundColor: Colors.lightBlueAccent);
                  }

                  return Text(
                      "processing state: ${describeEnum(processingState)}");
                }),
            StreamBuilder<PlaybackState>(
                stream: AudioService.playbackStateStream,
                builder: (context, snapshot) {
                  var playing = snapshot.data?.playing ?? false;
                  return Column(
                    children: [
                      Text(
                        playing ? "Playing" : "Stoped",
                        style: TextStyle(fontSize: 45),
                      ), //
                      CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.3),
                        radius: 45,
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: FloatingActionButton(
                            onPressed: () async {
                              playing ? pause() : play();
                            },
                            backgroundColor: !playing
                                ? AppColors.playButtonColor
                                : AppColors.playButtonPressedColor,
                            child:
                                Icon(playing ? Icons.pause : Icons.play_arrow),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlayer = AudioPlayer();
  final items = MediaItem(
    id: "http://stream.okradio.kg:8000/mp3-hq",
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    artUri: Uri.parse(
        "https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/Zugpsitze_mountain.jpg"),
  );

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    AudioServiceBackground.setMediaItem(items);

    // Listen to state changes on the player...
    _audioPlayer.playerStateStream.listen((playerState) {
      // ... and forward them to all audio_service clients.
      AudioServiceBackground.setState(
        playing: playerState.playing,
        // Every state from the audio player gets mapped onto an audio_service state.
        processingState: {
          ProcessingState.idle: AudioProcessingState.none,
          ProcessingState.loading: AudioProcessingState.connecting,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[playerState.processingState],
        // Tell clients what buttons/controls should be enabled in the
        // current state.
        controls: [
          playerState.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.stop,
        ],
      );
    });

    // Play when ready.
    _audioPlayer.play();

    // Start loading something (will play when ready).
    await _audioPlayer.setUrl(items.id);

    print("on start id: ${_audioPlayer.androidAudioSessionId}");
    return super.onStart(params);
  }

  @override
  Future<void> onStop() async {
    _audioPlayer.dispose();
    await AudioServiceBackground.setState(
      playing: false,
      controls: [],
      processingState: AudioProcessingState.stopped,
    );
    await super.onStop();
  }

  @override
  Future<void> onPlay() async {
    AudioServiceBackground.setState(
      playing: true,
      controls: [MediaControl.pause, MediaControl.stop],
      processingState: AudioProcessingState.ready,
    );
    print("on play id: ${_audioPlayer.androidAudioSessionId}");

    await _audioPlayer.play();
  }

  @override
  Future<void> onPause() async {
    AudioServiceBackground.setState(
        controls: [MediaControl.play, MediaControl.stop],
        playing: false,
        processingState: AudioProcessingState.ready);
    await _audioPlayer.pause();
    print("on pause ${_audioPlayer.androidAudioSessionId}");
  }
}
