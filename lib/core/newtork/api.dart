import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class Api {
  Future<http.Response> getArchives() async {
    final response = await http.get(Uri.parse(
        'https://okradio.kg/mobile/api/v2/get-broadcasts.php?section_id=10152'));

    return response;
  }
}
