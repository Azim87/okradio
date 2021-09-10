import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class OkRadioService extends BackgroundAudioTask {
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