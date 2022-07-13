import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/controllers/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get HomeController {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            ListTile(
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
                        "1",
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
                "Al-Fatihah",
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
                    "Makkiyah",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(135, 137, 163, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "7 Ayat",
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
                "الفاتحة",
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
          ],
        ),
      ),
    );
  }
}
