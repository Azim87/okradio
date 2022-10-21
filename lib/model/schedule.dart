class Schedule {
  final String? scheduleTime;
  final String? scheduleTitle;
  final String? scheduleDescription;

  const Schedule(
    this.scheduleTime,
    this.scheduleTitle,
    this.scheduleDescription,
  );

  static List<Schedule> scheduleMonday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', 'Сыр маек (кайталоо)', ''),
      Schedule('01:00', 'Музыка', ''),
      Schedule('02:00', '"Апалар мектеби" \n(кайталоо)', ''),
      Schedule('03:00 - 05:00', 'Музыка', ''),
      Schedule('05:00', 'Формула семьи (повтор)', ''),
      Schedule('06:00', 'Музыка', ''),
      Schedule('07:40', '"Жашоонун негиздери"', ''),
      Schedule('08:00 - 10:00', '"Кутман таң" шоу-уктуруусу', ''),
      Schedule('10:00 - 12:00', '"День добрый"', ''),
      Schedule('12:00 - 18:00', 'DJ сааты', ''),
      Schedule('18:00', 'Иммунитет', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', 'Формула семьи', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', '"День добрый" (повтор)', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleTuesday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', '«Ашар» (кайталоо)', ''),
      Schedule('01:00 - 03:00', 'Музыка', ''),
      Schedule('03:00', '"Назар" ток-шоусу (кайталоо)', ''),
      Schedule('04:00', 'Музыка', ''),
      Schedule('05:00', 'Формула семьи (повтор)', ''),
      Schedule('06:00', 'Музыка', ''),
      Schedule('07:40', '"Жашоонун негиздери"', ''),
      Schedule('08:00 - 10:00', '"Кутман таң" шоу-уктуруусу', ''),
      Schedule('10:00 - 12:00', '"День добрый"', ''),
      Schedule('12:00 - 18:00', 'DJ сааты', ''),
      Schedule('18:00', 'Иммунитет', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', 'Формула семьи', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', '"День добрый" (повтор)', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleWednesday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', '"Иммунитет" (кайталоо)', ''),
      Schedule('01:00', 'Музыка', ''),
      Schedule('02:00', '"Назар" ток-шоусу (кайталоо)', ''),
      Schedule('03:00', '«Ашар» (кайталоо)', ''),
      Schedule('04:00', 'Музыка', ''),
      Schedule('05:00', 'Формула семьи (повтор)', ''),
      Schedule('06:00', 'Музыка', ''),
      Schedule('07:40', '"Жашоонун негиздери"', ''),
      Schedule('08:00 - 10:00', '"Кутман таң" шоу-уктуруусу', ''),
      Schedule('10:00 - 12:00', '"День добрый"', ''),
      Schedule('12:00 : 18:00', 'DJ сааты', ''),
      Schedule('18:00', 'Сыр Маек', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', 'Формула семьи', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', '"День добрый" (повтор)', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleThursday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', '"Назар" ток-шоусу (кайталоо)', ''),
      Schedule('01:00 - 03:00', 'Музыка', ''),
      Schedule('03:00', '«Апалар мектеби» (кайталоо)', ''),
      Schedule('04:00', 'Музыка', ''),
      Schedule('05:00', 'Формула семьи (повтор)', ''),
      Schedule('06:00', 'Музыка', ''),
      Schedule('07:40', '"Жашоонун негиздери"', ''),
      Schedule('08:00 - 10:00', '"Кутман таң" шоу-уктуруусу', ''),
      Schedule('10:00 - 12:00', '"День добрый"', ''),
      Schedule('12:00 - 18:00', 'DJ сааты', ''),
      Schedule('12:30', 'DJ сааты', ''),
      Schedule('18:00', '"Ашар"', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', 'Формула семьи', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', '"День добрый" (повтор)', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleFriday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00', '«Апалар мектеби» (кайталоо)', ''),
      Schedule('01:00', 'Музыка', ''),
      Schedule('02:00', '"Сыр маек" (кайталоо)', ''),
      Schedule('03:00', '«Иммунитет» (кайталоо)', ''),
      Schedule('04:00', 'Музыка', ''),
      Schedule('05:00', 'Формула семьи (повтор)', ''),
      Schedule('06:00', 'Музыка', ''),
      Schedule('07:40', '"Жашоонун негиздери"', ''),
      Schedule('08:00 - 10:00', '"Кутман таң" шоу-уктуруусу', ''),
      Schedule('10:00 - 12:00', '"День добрый" (повтор)', ''),
      Schedule('12:00', 'DJ сааты', ''),
      Schedule('12:30', '"Укугуңду бил" рубрикасы', ''),
      Schedule('13:00 - 18:00', 'DJ сааты', ''),
      Schedule('18:00', '«Ашар»	"Назар" ток-шоусу', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', 'Формула семьи', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', '"День добрый" (повтор)', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleSaturday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00 - 07:40', 'Музыка', ''),
      Schedule('07:40', '"Шыктаныңыз"', ''),
      Schedule('08:00', 'Музыка', ''),
      Schedule('09:00 - 11:00', '"Таңкы маанай" уктуруусу', ''),
      Schedule('11:00', '"Укугуңду бил" рубрикасы', ''),
      Schedule('12:00', 'DJ сааты', ''),
      Schedule('12:30', '"Укугуңду бил" рубрикасы', ''),
      Schedule('13:00 - 19:00', 'DJ сааты', ''),
      Schedule('19:00 - 21:00', 'Музыка', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', 'Музыка', ''),
    ];

    return _scheduleList;
  }

  static List<Schedule> scheduleSunday() {
    final _scheduleList = <Schedule>[
      Schedule('00:00 - 07:40', 'Музыка', ''),
      Schedule('01:00', 'Музыка', ''),
      Schedule('07:40', '"Шыктаныңыз"', ''),
      Schedule('08:00 - 10:00', 'Музыка', ''),
      Schedule('10:00', '"Сыр маек" (кайталоо)', ''),
      Schedule('11:00', '"Укугуңду бил" рубрикасы', ''),
      Schedule('12:00', '"Иммунитет (кайталоо)"', ''),
      Schedule('12:30', '"Укугуңду бил" рубрикасы', ''),
      Schedule('13:00', 'DJ сааты', ''),
      Schedule('14:00', '"Апалар мектеби" (кайталоо)', ''),
      Schedule('15:00', 'Музыка', ''),
      Schedule('16:00', '"Ашар (кайталоо)"', ''),
      Schedule('17:00', 'Музыка', ''),
      Schedule('18:00', '"Назар" ток-шоусу (кайталоо)', ''),
      Schedule('19:00', 'Музыка', ''),
      Schedule('20:00', '"Бар заман" (кайталоо)', ''),
      Schedule('21:00', 'Час Классической музыки', ''),
      Schedule('22:00 - 00:00', 'Музыка', ''),
    ];

    return _scheduleList;
  }
}
