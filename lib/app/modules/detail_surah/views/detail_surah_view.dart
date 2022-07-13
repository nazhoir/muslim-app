import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/app/data/models/surah.dart';
import 'package:quran_app/app/data/models/surah_detail.dart' as detail;

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(135, 137, 163, 1)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '${surah.name!.transliteration!.id}',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(103, 44, 188, 1),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 327,
                height: 257,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                      "images/decoration3.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${surah.name!.transliteration!.id}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${surah.name!.translation!.id}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white,
                        indent: 60,
                        endIndent: 60,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${surah.revelation!.id?.toUpperCase()}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${surah.numberOfVerses} AYAT",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "ِبِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيْم",
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FutureBuilder<detail.SurahDetail>(
                  future: controller.getDetailSurah(surah.number.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Data Tidak Ditemukan"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.verses?.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.verses!.isEmpty) {
                          return SizedBox();
                        }
                        detail.Verse ayat = snapshot.data!.verses![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 27,
                                  width: 27,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Color.fromRGBO(134, 62, 213, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${ayat.number!.inSurah}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Ionicons.share_social_outline,
                                        color: Color.fromRGBO(134, 62, 213, 1),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Ionicons.play_outline,
                                        color: Color.fromRGBO(134, 62, 213, 1),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Ionicons.bookmark_outline,
                                        color: Color.fromRGBO(134, 62, 213, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: 305,
                              child: Text(
                                "${ayat.text!.arab}",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.amiri(
                                  textStyle: const TextStyle(
                                    height: 2.3,
                                    wordSpacing: 4,
                                    letterSpacing: 0.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(36, 15, 79, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
