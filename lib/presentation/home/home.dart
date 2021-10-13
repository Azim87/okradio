import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ok_radio_flutter/main.dart';
import 'package:ok_radio_flutter/presentation/home/bottom_bar.dart';
import 'package:ok_radio_flutter/presentation/screens/splash/splash_screen.dart';

import '../../assets.dart';
import '../../colors.dart';

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
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
                  audioHandler.stop();
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
        bottomNavigationBar: BottomNavBar(),
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
                      stream: audioHandler.playbackState
                          .map((event) => event.processingState)
                          .distinct(),
                      builder: (context, snapshot) {
                        final processingState =
                            snapshot.data ?? AudioProcessingState.idle;
                        if (processingState == AudioProcessingState.loading) {
                          Fluttertoast.showToast(
                            msg: "Подключение к потоку...",
                            backgroundColor: Colors.lightBlueAccent,
                          );
                        }
                        return Text(
                            "processing state: ${describeEnum(processingState)}");
                      }),
                  StreamBuilder<bool>(
                      stream: audioHandler.playbackState
                          .map((event) => event.playing)
                          .distinct(),
                      builder: (context, snapshot) {
                        var playing = snapshot.data ?? false;
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
                                    playing
                                        ? audioHandler.pause()
                                        : audioHandler.play();
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
