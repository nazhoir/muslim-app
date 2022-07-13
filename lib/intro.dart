import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/views/landing.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 195,
                  margin: const EdgeInsets.symmetric(vertical: 56),
                  child: Column(
                    children: [
                      Text(
                        "Qur'an App",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(103, 44, 188, 1),
                          ),
                        ),
                      ),
                      Text(
                        "Learn Quran and Recite once everyday",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(135, 137, 163, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: Image.asset(
                    "images/decoration1.png",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Landing()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    height: 60,
                    width: 185,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(249, 176, 145, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
