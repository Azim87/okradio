import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ok_radio_flutter/core/di/inject.dart';

import 'package:ok_radio_flutter/util/colors.dart';

import 'cubit/archive_cubit.dart';
import 'cubit/archive_state.dart';

class ArchivePage extends StatelessWidget {
  ArchivePage({Key? key}) : super(key: key);

  final archiveCubit = get<ArchiveCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchiveCubit, ArchiveState>(
      bloc: archiveCubit..getArchives(),
      builder: (context, state) {
        print(state.archives);

        return Expanded(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: state.archives.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    state.archives[index].title!,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.archives[index].image ?? '',
                        width: 100,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          state.archives[index].content!,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
