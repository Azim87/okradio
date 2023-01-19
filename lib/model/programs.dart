import '../util/assets.dart';

class Programs {
  final String? title;

  final String? content;

  final String? image;

  final int? id;

  Programs({
    this.title,
    this.content,
    this.image,
    this.id,
  });

  factory Programs.fromJson(Map<String, dynamic> parsedJson) {
    return Programs(
        id: parsedJson['id'],
        title: parsedJson['title'].toString(),
        image: parsedJson['image'].toString(),
        content: parsedJson['content'].toString());
  }

  @override
  String toString() {
    return 'Programs(title: $title, content: $content,  image: $image, id: $id,)';
  }
}

List<Programs> getProgramData() {
  final programList = <Programs>[
    Programs(
        id: 10152,
        image: Assets.image1,
        title: 'Ашар',
        content:
            '«Ашар» уктуруусунда замандашыбыздын кѳйгѳйүн ортого салып, чыгуу жолун бирге издейбиз. Эгер сиз да кайсы бир кырдаалдан чыгуу жолун таппай турсаӊыз, «Ашарга» кош келиӊиз. Сейил Калдыбаева жалпы угармандарыбыз менен бирге жардам берүүгѳ даяр. Жуманын бейшемби күнү, саат 18:00дѳ сиздерди «ОК» радиосунун аба толкунунда күтөбүз.'),
    Programs(
      id: 957,
      image: Assets.image2,
      title: 'День добрый',
      content:
          '«День Добрый!» с 7 до 9 утра с понедельника по пятницу в прямом эфире Теос! Ответы и практические рекомендации от психолога Евгения Сарапулова.',
    ),
    Programs(
      id: 10154,
      image: Assets.image3,
      title: 'Кутман Таң',
      content:
          'Таӊды кандай тозсоӊуз, күнүӊүз ошондой уланат!» Жашоо — күндөрдөн, ал эми күн аткан таӊдан турат! Ар бир күнүӊүз көӊүлдүү жана пайдалуу өтсүн, коомдон артта калбайын, бардыгынан кабардар болоюн десеӊиз, «Ок» радиосунун «Кутман таӊ» шоу уктуруусуна кош келиӊиз! Иш күндөрү таӊкы саат 8.00-10.00 гө чейин таӊкы шоуну Айнура Миназарованын жана Канат Алманбетовтун алып баруусунда угуӊуздар!',
    ),
    Programs(
        id: 10155,
        image: Assets.image4,
        title: 'Сыр Маек (архив)',
        content:
            'Аптанын шаршемби күнү, кечки саат алтыда «ОК» радиосунун «Сыр маек» уктуруусунан сизди күтөбүз. Уюткулуу элибиздин, сыймыктуу инсандары сиздерге сырын ачып, кызыктуу маек куруп беришет. Студиябыздын куттуу төрүнө Канат Алманбетов чакырат.'),
    Programs(
      id: 10156,
      image: Assets.image5,
      title: 'Назар (архив)',
      content:
          '"Коомдук кырдаалга Карыпов Уланбек менен чогуу назар салыӊыздар.',
    ),
    Programs(
        id: 10157,
        image: Assets.image6,
        title: ' Апалар Мектеби',
        content:
            'Бала тарбиялоо – аялдын эӊ улуу иши. Эне баласынын денеси үчүн гана кам көрбөстөн, анын жан дүйнөсүнө, жүрүм-турумуна, адеп-ахлактык тарбиясына зор таасир берет. Ал балдарынын жакшы адаттарды өздөштүрүүсүнө көмөктөшөт. Баланын адаттары жаӊыдан пайда болуп, мүнөзү калыптанып келе жатканда, эненин таасири баарынан күчтүү.'),
    Programs(
        id: 11776,
        image: Assets.image7,
        title: 'Бар заман (архив)',
        content:
            'Үй-бүлө институту ар түрдүү коомдо ар кандай жолдорду басып өтүп, калыптанат. Бүгүнкү күндө төгөрөгү төп келген, бардыгы кенен, коогасыз БАР ЗАМАНДА жакшыдан үлгү алып, жамандан арылып, үй-бүлөнүн түндүгү бийик көтөрүлүп турушуна көз салуу гана зарыл. “БАР ЗАМАН” үй-бүлөнүн учурдун талабына шайкеш, улуттук дөөлөттөрдү бийик кармап, бакубат өмүр сүрүүгө үндөйт.'),
    Programs(
        id: 11713,
        image: Assets.image8,
        title: 'Иммунитет',
        content:
            'Ден соолуктун камын кѳрүп, сергек жашоо образын сактап, узак, сапаттуу жана бактылуу ѳмүр сүргүңүз келсе, “Иммунитет” программасы сиз үчүн! Уктуруубузда дарыгерлер, диетологдор, ден соолукка кам кѳрүүгѳ мыкты кеңеш бере алган ар тараптуу инсандар конокто болот. Уктуруунун алып баруучусу журналист Айнура Миназарова сиздерди ар дүйшѳмбү кечки саат 18.00до Ок радиосунда күтѳт!'),
    Programs(
        id: 12642,
        image: Assets.image9,
        title: 'Секреты счастья (архив)',
        content:
            '"Секреты счастья" - это школа жизни на "Радио Ок". Как жить, чтобы ощущать радость и удовлетворение и не чувствовать себя несчастным. В прямом эфире - уроки практической психологии и беседы с интересными людьми. Гости ток-шоу делятся своим пониманием счастья и отвечают на вопросы радиослушателей вместе с ведущей передачи Бермет Бексултан.'),
    Programs(
        id: 12915,
        image: Assets.image10,
        title: "Ощути силу перемен",
        content:
            'В передаче /"Ощути силу перемен/" Алтынбек Искендеров разберёт самые актуальные жизненные вопросы и пригласит самых интересных гостей.'),
  ];
  return programList;
}
