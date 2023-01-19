import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ok_radio_flutter/core/navigation/navigation.dart';
import 'package:ok_radio_flutter/presentation/archive/archive_details/cubit/archive_details_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ok_radio_flutter/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/inject.dart';
import '../../../util/colors.dart';
import 'cubit/archive_details_state.dart';

class ArchiveDetailsPage extends StatefulWidget {
  ArchiveDetailsPage({
    super.key,
    required this.id,
    required this.title,
    required this.index,
  });

  final int id;
  final String title;
  final int index;

  @override
  State<ArchiveDetailsPage> createState() => _ArchiveDetailsPageState();
}

class _ArchiveDetailsPageState extends State<ArchiveDetailsPage> {
  late ArchiveDetailsCubit archiveDetailsCubit;

  @override
  void initState() {
    super.initState();
    archiveDetailsCubit = get.get<ArchiveDetailsCubit>();
    archiveDetailsCubit..fetchProgramArchives(widget.id);
  }

  String getPrograms() {
    switch (widget.index) {
      case 0:
        return Strings.ashar;
      case 1:
        return Strings.denDobryi;
      case 2:
        return Strings.kutmanTan;
      case 3:
        return Strings.syrmaek;
      case 4:
        return Strings.nazar;
      case 5:
        return Strings.apalarMektebi;
      case 6:
        return Strings.barZaman;
      case 7:
        return Strings.immunitet;
      case 8:
        return Strings.sekretSchastya;
      case 9:
        return Strings.silaPeremen;

      default:
        return Strings.ashar;
    }
  }

  Future<void> openPage() async {
    final pageUrl = Uri.parse(getPrograms());

    if (!await launchUrl(
      pageUrl,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $pageUrl';
    }
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    final noButton = TextButton(
      child: Text(AppLocalizations.of(context)!.no),
      onPressed: () => Navigation.router.pop<bool>(true),
    );
    final okButton = TextButton(
      child: Text(AppLocalizations.of(context)!.yes),
      onPressed: () {
        Navigation.router.pop<bool>(true);
        openPage();
      },
    );

    final alert = AlertDialog(
      title: Text(widget.title),
      content: Text(AppLocalizations.of(context)!.redirect),
      actions: [
        noButton,
        okButton,
      ],
    );
    return await showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigation.router.pop<bool>(true),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 35,
            ),
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<ArchiveDetailsCubit, ArchiveDetailsState>(
          bloc: archiveDetailsCubit,
          builder: (context, state) {
            print('archive length: ${state.archive.length}');

            if (state.archive.isEmpty)
              return Center(child: CircularProgressIndicator());

            if (state.archive.length == 1) {
              return Center(child: Text(AppLocalizations.of(context)!.nodata));
            }

            if (state.archive.length == 0) {
              return Center(child: Text(AppLocalizations.of(context)!.nodata));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.archive.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => _showAlertDialog(context),
                child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
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
                        CachedNetworkImage(
                          imageUrl: state.archive[index].image!,
                          width: 100,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              state.archive[index].title!,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(state.archive[index].content ?? ''),
                          ],
                        ))
                      ],
                    )),
              ),
            );
          },
        ),
      );
}
