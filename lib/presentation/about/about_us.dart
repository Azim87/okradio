import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/navigation/navigation.dart';
import '../../util/colors.dart';
import '../../util/styles.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textList = [
      AppLocalizations.of(context)!.text1,
      AppLocalizations.of(context)!.text2,
      AppLocalizations.of(context)!.text3,
      AppLocalizations.of(context)!.text4,
      AppLocalizations.of(context)!.text5,
      AppLocalizations.of(context)!.text6,
      AppLocalizations.of(context)!.text7,
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/anim/patterns.png')),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Navigation.router.pop(),
                      icon: Icon(Icons.arrow_back_ios_new_outlined)),
                  Text(
                    AppLocalizations.of(context)!.aboutUs,
                    style: Styles.defaultPageTitleStyle,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: textList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0)
                      return Text(
                        'Радио ОК',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      );
                    else
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          textList[index - 1],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
