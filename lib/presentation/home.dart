import 'package:fluttertoast/fluttertoast.dart';
import 'package:audio_service/audio_service.dart';
import 'package:ok_radio_flutter/presentation/screens/splash/splash_screen.dart';
import '../service/okradio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../assets.dart';
import '../colors.dart';

backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => OkRadioService());
}

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
  pause() => AudioService.pause();

  play() async {
    try {
      await AudioService.start(
        backgroundTaskEntrypoint: backgroundTaskEntrypoint,
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
                  AudioService?.stop();
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
        body: Container(
          child: Stack(
            children: [
              OkRadioBackgroundContainer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(Assets.app_logo),
                      ),
                    ],
                  ),
                  StreamBuilder<AudioProcessingState>(
                      stream: AudioService.playbackStateStream
                          .map((event) => event.processingState)
                          .distinct(),
                      builder: (context, snapshot) {
                        final processingState =
                            snapshot.data ?? AudioProcessingState.none;
                        if (processingState ==
                            AudioProcessingState.connecting) {
                          Fluttertoast.showToast(
                            msg: "Подключение к потоку...",
                            backgroundColor: Colors.lightBlueAccent,
                          );
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
                              playing ? "Playing" : "Stopped",
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
            ],
          ),
        ),
      ),
    );
  }
}
