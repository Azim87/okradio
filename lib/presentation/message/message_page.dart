import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';
import '../../colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return Scaffold(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Связаться с эфиром',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset(Assets.settings),
                ],
              ),
            ),
            SizedBox(height: height.height * 0.05),
            Center(
              child: SvgPicture.asset(Assets.app_logo),
            ),
            Expanded(child: const SizedBox(height: 20)),
            CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: 40,
              child: SizedBox(
                height: 65,
                width: 65,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: AppColors.secondary,
                  onPressed: () async {},
                  child: SvgPicture.asset(
                    Assets.call,
                    height: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: height.height * 0.1),
          ],
        ),
      ),
    );
  }
}
