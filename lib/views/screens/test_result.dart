import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/views/screens/first_page.dart';
import 'package:quiz_app/controller/provider_.dart';

class TestResult extends StatelessWidget {
 const TestResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 173, 237),
        leading: const Icon(
          Icons.menu,
          color: Colors.indigo,
          size: 45,
        ),
      ),
      body: Consumer<ProviderData>(builder: (context, getData, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Result',
                style: GoogleFonts.alfaSlabOne(fontSize: 30),
              ),
              SizedBox(
                height: mediaQuery.size.height / 50,
              ),
              Text(
                "${getData.mark}%",
                style:
                    GoogleFonts.alfaSlabOne(fontSize: 30, color: Colors.green),
              ),
              SizedBox(
                height: mediaQuery.size.height / 10,
              ),
              ElevatedButton(
                onPressed: () {
                  getData.match = false;
                  getData.mark = 0;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: ((context) =>const FirstPage())),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Text(
                  "Restart Quiz",
                  style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height / 50,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Text(
                  "Close App",
                  style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
