import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class Api {
  Future<http.Response> getPrograms() async {
    final response = await http.get(
      Uri.parse('https://okradio.kg/mobile/api/v2/get-broadcasts_section.php'),
    );

    return response;
  }

  Future<http.Response> getProgramArchives(int ids) async {
    final response = await http.get(
      Uri.parse(
          'https://okradio.kg/mobile/api/v2/get-broadcasts.php?section_id=$ids'),
      headers: {"Content-Type": "application/json"},
    );

    return response;
  }
}
