import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/screens/quiz_page.dart';
import 'package:quiz_app/views/widgets/list/list_dart.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/images/Untitled.png'),
            ),
            SizedBox(
              height: mediaQuery.size.height / 12,
            ),
            SizedBox(
              height: mediaQuery.size.height / 12,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: mediaQuery.size.width / 5,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(dart[index],
                          style: GoogleFonts.lobster(fontSize: 25)),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height / 19,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                'Welcome',
                style: GoogleFonts.lobster(fontSize: 35, color: Colors.blue),
              ),
            ),
            Center(
              child: Text(
                'to our app Quiz Dart !',
                style: GoogleFonts.lobster(fontSize: 30),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height / 26,
            ),
            Center(
              child: Container(
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(.7, 1.5),
                    colors: <Color>[
                      Colors.blue,
                      Colors.white,
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Test',
                          style: GoogleFonts.alfaSlabOne(fontSize: 30),
                        ),
                        Text(
                          'Your',
                          style: GoogleFonts.alfaSlabOne(fontSize: 30),
                        ),
                        Text(
                          'SKILLS',
                          style: GoogleFonts.alfaSlabOne(fontSize: 30),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: mediaQuery.size.width / 3,
                        child: Image.asset('assets/images/clipart3256362.png'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: mediaQuery.size.width / 1.5,
                  top: mediaQuery.size.height / 39),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const QuizPage()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Text(
                  "let's GO ?",
                  style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
