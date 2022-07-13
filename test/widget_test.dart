import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/models/surah_detail.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // print(data[5]);

  Surah surahAnnas = Surah.fromJson(data[113]);
  // print(surahAnnas.name!.long);
  // print(surahAnnas.number);
  // print(surahAnnas.numberOfVerses);
  // print(surahAnnas.revelation);
  // print(surahAnnas.tafsir!.id);

  Uri urlAnnas =
      Uri.parse("https://api.quran.sutanlab.id/surah/${surahAnnas.number}");
  var resAnnas = await http.get(urlAnnas);

  Map<String, dynamic> dataAnnas =
      (json.decode(resAnnas.body) as Map<String, dynamic>)["data"];

  SurahDetail annas = SurahDetail.fromJson(dataAnnas);

  print(annas.name!.long);
  print(annas.numberOfVerses);
  print(annas.verses![0].text!.arab);
}
