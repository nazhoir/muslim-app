import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/app/routes/app_pages.dart';

import '../../../data/models/surah.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<List<Surah>>(
          future: controller.getAllSurah(),
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
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                Surah surah = snapshot.data![index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                      },
                      leading: Stack(
                        children: [
                          Image.asset(
                            "images/decoration2.png",
                            height: 36,
                          ),
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${surah.number}",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(36, 15, 79, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "${surah.name!.transliteration!.id}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(36, 15, 79, 1),
                          ),
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "${surah.revelation!.id}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(135, 137, 163, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${surah.numberOfVerses} Ayat",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(135, 137, 163, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        "${surah.name!.short}",
                        style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(134, 62, 213, 1),
                          ),
                        ),
                      ),
                      isThreeLine: true,
                    ),
                    const Divider(
                      height: 1,
                      color: Color.fromRGBO(187, 196, 206, 1),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
