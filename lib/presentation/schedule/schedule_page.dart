import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ok_radio_flutter/core/di/inject.dart';
import 'package:ok_radio_flutter/presentation/schedule/cubit/schedule_cubit.dart';
import 'package:ok_radio_flutter/util/enums.dart';
import 'package:ok_radio_flutter/util/extensions.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String? selectedValue;
  final scheduleCubit = get<ScheduleCubit>();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => scheduleCubit,
        child: Expanded(
          child: Column(
            children: [
              DropdownButtonFormField2<DayType>(
                value: DayType.Monday,
                alignment: AlignmentDirectional.center,
                buttonHeight: 30,
                itemHeight: 30,
                decoration: InputDecoration(
                  label: Text(
                    AppLocalizations.of(context)!.selectADay,
                  ),
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                isExpanded: true,
                items: DayType.values
                    .mapIndexed(
                      (index, days) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: days,
                        child: Text(days.days(context)),
                      ),
                    )
                    .toList(),
                onChanged: (value) => scheduleCubit.onDayChange(value!),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<ScheduleCubit, ScheduleState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.scheduleList?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTileTheme(
                            contentPadding: EdgeInsets.all(0),
                            dense: true,
                            child: ListTile(
                              leading: Text(
                                state.scheduleList?[index].scheduleTime ?? '',
                              ),
                              title: Text(
                                state.scheduleList?[index].scheduleTitle ?? '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
