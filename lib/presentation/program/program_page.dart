import 'package:flutter/material.dart';
import 'package:ok_radio_flutter/presentation/archive/archive_page.dart';
import 'package:ok_radio_flutter/presentation/schedule/schedule_page.dart';
import 'package:ok_radio_flutter/util/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../util/styles.dart';
import '../widgets/popup_widget.dart';

class ProgramsPage extends StatefulWidget {
  ProgramsPage({Key? key}) : super(key: key);

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  late bool archive = false;

  late bool schedule = true;

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.programs,
                  style: Styles.defaultPageTitleStyle,
                ),
                PopUpWidget(),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 2,
              color: AppColors.dividerColor,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() {
                      schedule = true;
                      archive = false;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Расписание',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: schedule
                              ? AppColors.white
                              : AppColors.dividerColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: schedule ? AppColors.primary : AppColors.white,
                        border: Border.all(
                          width: 1,
                          color: schedule
                              ? AppColors.primary
                              : AppColors.dividerColor,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(
                      () {
                        archive = true;
                        schedule = false;
                      },
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Архив',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: archive
                              ? AppColors.white
                              : AppColors.dividerColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: archive ? AppColors.primary : AppColors.white,
                        border: Border.all(
                          width: 1,
                          color: archive
                              ? AppColors.primary
                              : AppColors.dividerColor,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (archive) ArchivePage(),
            if (schedule) SchedulePage()
          ],
        ),
      ),
    );
  }
}
