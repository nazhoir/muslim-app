import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeController {
  getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    return data;
  }
}
