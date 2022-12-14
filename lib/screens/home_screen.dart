import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(247, 223, 194, 1),
        title: Text(
          "לא נעים אחי",
          style: GoogleFonts.amaticSc(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 50,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  color: Color.fromARGB(131, 83, 83, 83),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(247, 223, 194, 1),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('התראות',
                    style: GoogleFonts.alef(
                        fontSize: 23, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text('מישהו חייב לי',
                      style: GoogleFonts.alef(
                          fontSize: 18,
                          color: const Color.fromRGBO(2, 15, 56, 1))),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('נקה הכל',
                      style: GoogleFonts.alef(
                          fontSize: 14,
                          color: const Color.fromRGBO(2, 15, 56, 1))),
                )
              ],
            ),
            Expanded(
              child: globals.alarmsCount == 0
                  ? Column(
                      children: [
                        SvgPicture.asset('assets/no_alarms.svg'),
                        Text('לא תוזמנו התראות',
                            style: GoogleFonts.alef(
                                fontSize: 14,
                                color: const Color.fromRGBO(2, 15, 56, 1)))
                      ],
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                      children: List.generate(globals.alarmsCount, (index) {
                        return const Reminder();
                      }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Card(
        color: const Color.fromRGBO(253, 254, 150, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "נתנאל אחים ממן",
                style:
                    GoogleFonts.alef(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Color.fromARGB(255, 224, 127, 7),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "וואלה שילמתי על המניאק והוא לא החזיר",
                  style: GoogleFonts.alef(fontSize: 14.5),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Sep 02, 2022",
                  style: GoogleFonts.alef(
                      fontSize: 12,
                      color: const Color.fromRGBO(133, 133, 133, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
