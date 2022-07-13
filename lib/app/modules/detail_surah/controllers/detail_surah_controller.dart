import 'package:get/get.dart';
import 'package:quran_app/app/data/models/surah_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailSurahController extends GetxController {
  Future<SurahDetail> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$id");
    var res = await http.get(url);

    // print(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return SurahDetail.fromJson(data);
  }
}
