import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ok radio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioServiceWidget(child: HomePage()),
      builder: EasyLoading.init(),
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
    AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
    if (AudioService.running) {
      AudioService.play();
    }
  }

  @override
  void dispose() {
    AudioService?.disconnect();

    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title:  Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Жок'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  AudioService.stop();
                },
                child:  Text('Ооба'),
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white, // status bar color
          brightness: Brightness.light, // status bar brightness
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<PlaybackState>(
                  stream: AudioService.playbackStateStream,
                  builder: (context, snapshot) {
                    var playing = snapshot.data?.playing ?? true;
                    final processingState = snapshot.data?.processingState ??
                        AudioProcessingState.stopped;
                    return Column(
                      children: [
                        Text(
                          playing ? "Playing" : "Stopped",
                          style: TextStyle(fontSize: 45),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          radius: 45,
                          child: SizedBox(
                            height: 65,
                            width: 65,
                            child: FloatingActionButton(
                              onPressed: () {
                                if (playing) {
                                  pause();
                                } else {
                                  play();
                                }
                              },
                              child: Icon(
                                  playing ? Icons.pause : Icons.play_arrow),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlayer = AudioPlayer();
  final items = MediaItem(
    id: "http://stream.okradio.kg:8000/mp3-hq",
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    artUri: Uri.parse(
        "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
  );

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
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
