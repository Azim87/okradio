import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ok_radio_flutter/core/newtork/network_checker.dart';

import '../../main.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';
import '../widgets/popup_widget.dart';

class PlayRadioPage extends StatefulWidget {
  const PlayRadioPage({Key? key}) : super(key: key);

  @override
  State<PlayRadioPage> createState() => _PlayRadioPageState();
}

class _PlayRadioPageState extends State<PlayRadioPage>
    with TickerProviderStateMixin {
  late AnimationController? _controller = AnimationController(vsync: this);
  final NetworkChecker network = NetworkChecker();

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.background),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height.height * 0.04),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: PopUpWidget(),
                  ),
                ),
                SizedBox(height: height.height * 0.05),
                Center(
                  child: SvgPicture.asset(Assets.app_logo),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.familyRadio,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Lottie.asset(
                  'assets/anim/music.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller
                      ?..duration = composition.duration
                      ..stop();
                  },
                ),
                SizedBox(height: height.height * 0.1),
                StreamBuilder<bool>(
                  stream: audioHandler.playbackState
                      .map((event) => event.playing)
                      .distinct(),
                  builder: (context, snapshot) {
                    final playing = snapshot.data ?? false;

                    playing ? _controller?.repeat() : _controller?.stop();

                    return _buildPlayButton(playing);
                  },
                ),
                SizedBox(height: height.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.closeApp),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text(AppLocalizations.of(context)!.no),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  audioHandler.stop();
                },
                child: Text(AppLocalizations.of(context)!.yes),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget _buildPlayButton(bool playing) => CircleAvatar(
        backgroundColor: AppColors.secondary,
        radius: 40,
        child: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColors.secondary,
            onPressed: () async {
              if (await network.isConnected) {
                playing ? audioHandler.pause() : audioHandler.play();
                playing ? _controller?.stop() : _controller?.repeat();
              } else {}
            },
            child: SvgPicture.asset(
              playing ? Assets.pause : Assets.play,
            ),
          ),
        ),
      );
}
