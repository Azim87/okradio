import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ok_radio_flutter/util/constants.dart';

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;
  MediaState(this.mediaItem, this.position);
}

class AudioPlayerHandler extends BaseAudioHandler {
  final players = AudioPlayer();

  static final _item = MediaItem(
    id: Strings.radio_id,
    title: "Биринчи үй-бүлөлүк радио - Первое семейно радио",
    artUri: Uri.parse(Strings.art_uri),
  );

  AudioPlayerHandler() {
    players.playbackEventStream.map(_transformEvent).pipe(playbackState);

    mediaItem.add(_item);

    players.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  @override
  Future<void> play() => players.play();

  @override
  Future<void> stop() => players.stop();

  @override
  Future<void> pause() => players.pause();

  PlaybackState _transformEvent(PlaybackEvent event) => PlaybackState(
        controls: [
          if (players.playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
        ],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.completed: AudioProcessingState.completed,
        }[players.processingState]!,
        playing: players.playing,
      );
}
