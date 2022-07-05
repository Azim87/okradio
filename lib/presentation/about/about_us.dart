import 'package:flutter/material.dart';
import 'package:ok_radio_flutter/core/navigation/navigation.dart';
import 'package:ok_radio_flutter/util/colors.dart';

import '../../util/styles.dart';
import '../message/message_page.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);

  final _infoList = [
    'OK Radio — первая семейная радиостанция в Кыргызстане.',
    'Наш девиз: "Семья - источник счастья!"',
    'OK Radio — это отличная возможность откровенно поговорить о реальной жизни. В эфире ОК Радио мы находимся с вами в прямой связи и вместе находим выход из различных сложных ситуаций.',
    'Аудитория радио – каждая кыргызская семья. Те, кто ищет истинный смысл жизни, уважает культурные, духовные и общечеловеческие ценности, гражданские и социально активные личности. Они не ограничены по возрастным, социально-экономическим, религиозным и этническим признакам. Основной возраст наших слушателей старше 18 лет.OK Radio — это позитивная атмосфера, интересные темы, живые дискуссии, полезные советы, классическая и современная музыка, приятная атмосфера и творческий подход. Мы стремимся быть полноценным интервьюером и находить простые ответы на самые сложные вопросы совместной жизни.',
    'OK Radio впервые вышло в эфир 3 мая 1996 года. Сегодня OK Radio доступно круглосуточно в Чуйской, Таласской, Нарынской, Иссык-Кульской областях и в южных городах Ош, Джалал-Абад, Токтогул и Каракол. Радио ОК можно услышать на FM 100,5 в Чуйской области и Бишкеке, FM 88,8 на Иссык-Куле, FM 88,3 в Токтогуле и Караколе, FM 88,4 в Оше и Джалал-Абаде, FM 89,8 в Таласе и FM 87,5 в Нарынской области.Вы также можете посмотреть видео наших прямых эфиров на сайте www.okradio.kg и на нашей странице в Facebook «Радио ОК».',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/anim/patterns.png'))),
        child: Column(
          children: [
            SizedBox(height: height.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigation.router.pop(),
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
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
            const SizedBox(height: 16),
            Text(
              'Радио ОК',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    _infoList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                itemCount: _infoList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
