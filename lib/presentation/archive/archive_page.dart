import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:ok_radio_flutter/util/colors.dart';
import '../../core/newtork/network_checker.dart';
import '../../model/programs.dart';

class ArchivePage extends StatelessWidget {
  ArchivePage({Key? key}) : super(key: key);

  final programList = getProgramData();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: programList.length,
        itemBuilder: (context, index) => Material(
          child: InkWell(
            onTap: () async {
              if (!await NetworkChecker().isConnected) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(AppLocalizations.of(context)!.noConnection)));

                return;
              }
              context.goNamed(
                'archive_detail',
                params: {
                  'id': programList[index].id.toString(),
                  'title': programList[index].title!,
                  'index': index.toString()
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(programList[index].image ?? ''),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          programList[index].title!,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(programList[index].content!),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
