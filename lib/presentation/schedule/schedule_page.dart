import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ok_radio_flutter/util/enums.dart';
import 'package:ok_radio_flutter/util/extensions.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        DropdownButtonFormField2(
          alignment: AlignmentDirectional.center,
          buttonHeight: 30,
          itemHeight: 30,
          decoration: InputDecoration(
            label: Text('Выберите день недели'),
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
          onChanged: (value) {
            setState(() {
              selectedValue = value as String?;
              print(value);
            });
          },
        ),
      ]),
    );
  }
}
