class Schedule {
  final String? scheduleTime;
  final String? scheduleTitle;
  final String? scheduleDescription;

  const Schedule(
    this.scheduleTime,
    this.scheduleTitle,
    this.scheduleDescription,
  );

  List<Schedule> scheduleData() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', 'Сыр маек (кайталоо)', scheduleDescription),
    ];

    return _scheduleList;
  }
}
