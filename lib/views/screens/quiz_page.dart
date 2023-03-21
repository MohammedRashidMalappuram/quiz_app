import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/views/screens/test_result.dart';
import 'package:quiz_app/views/widgets/list/list_dart.dart';
import 'package:quiz_app/views/widgets/qes_and_ans.dart';
import 'package:quiz_app/controller/provider_.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool match = false;
  int pageindex = 1;
  int mark = 0;
  int buttonindex = -1;

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
        title: Text(
          'chooose the correct answer',
          style: GoogleFonts.alfaSlabOne(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Consumer<ProviderData>(builder: (context, getData, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height / 2.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 36, 173, 237),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Text(
                    datas['questions'][pageindex]['question'],
                    style: const TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height / 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  //  width: double.maxFinite,
                  height: mediaQuery.size.height / 2.5,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: datas['questions'][pageindex]['answers'].length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        overlayColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 36, 173, 237)),
                        onTap: (() {
                          buttonindex = index;
                          getData.answerCheck(index, buttonindex, pageindex);

                          pageindex <= 4
                              ? pageindex++
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const TestResult()),
                                  ),
                                );
                        }),
                        child: Container(
                          margin:
                              EdgeInsets.only(top: mediaQuery.size.height / 50),
                          height: mediaQuery.size.height * .07,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 36, 173, 237),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: mediaQuery.size.width * .06,
                              ),
                              Text(
                                "${number[index]}. ",
                                style: GoogleFonts.lobster(fontSize: 20),
                              ),
                              SizedBox(
                                width: mediaQuery.size.width * .7,
                                child: Text(
                                  datas['questions'][pageindex]['answers']
                                      [index],
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      //
                    }),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
