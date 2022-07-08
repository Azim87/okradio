class Schedule {
  final String? programTime;
  final String? programTitle;
  final String? programDescription;

  const Schedule(
    this.programTime,
    this.programTitle,
    this.programDescription,
  );

  List<Schedule> programData() {
    final _programList = <Schedule>[
      Schedule('00:00', 'Сыр маек (кайталоо)', programDescription),
    ];

    return _programList;
  }
}
