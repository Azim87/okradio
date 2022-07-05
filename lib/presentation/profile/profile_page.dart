import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ok_radio_flutter/util/styles.dart';

import '../../util/assets.dart';
import '../message/message_page.dart';

class SocialMedia {
  SocialMedia({this.icon, this.label});
  final String? icon;
  final String? label;
}

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _socialList = <SocialMedia>[
    SocialMedia(icon: Assets.email, label: 'info@okradio.kg'),
    SocialMedia(icon: Assets.facebook, label: 'Мы в Facebook'),
    SocialMedia(icon: Assets.whatsapp, label: 'Мы в WhatsApp'),
    SocialMedia(icon: Assets.youtube, label: 'Мы в Youtube'),
    SocialMedia(icon: Assets.tiktok, label: 'Мы в TikTok'),
  ];

  final _radioFmList = <String>[
    '100,5 FM - Бишкек, Чуйская область',
    '88,8 FM - Ыссык-Кульская область',
    '89,8 FM - Таласская область',
    '88,3 FM - Токтогул, Кара-Kол',
    '87,5 FM - Нарынская область',
    '88,4 FM - Джалал-Абадская, Ошская область',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: height.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'О нас',
                  style: Styles.defaultPageTitleStyle,
                ),
                PopUpWidget(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 2,
              color: Color(0xFFD9D9D9),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: SvgPicture.asset(
                  _socialList[index].icon!,
                ),
                title: Text(
                  _socialList[index].label!,
                  style: Styles.socialMediaTextStyle,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              separatorBuilder: (context, i) => Container(
                margin: const EdgeInsets.only(
                  left: 73,
                  right: 16,
                ),
                height: 1,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              itemCount: _socialList.length,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Радио',
                style: Styles.defaultPageTitleStyle,
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  _radioFmList[index],
                  style: Styles.socialMediaTextStyle,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              separatorBuilder: (context, i) => Container(
                margin: const EdgeInsets.only(right: 16),
                height: 1,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              itemCount: _radioFmList.length,
            ),
          ],
        ),
      ),
    );
  }
}
