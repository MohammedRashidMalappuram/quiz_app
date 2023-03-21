import 'package:flutter/cupertino.dart';
import 'package:quiz_app/views/widgets/qes_and_ans.dart';

class ProviderData extends ChangeNotifier {
  bool match = false;

  int mark = 0;

  void answerCheck(int index, int buttonindex, int pageindex) {
    buttonindex = index;
    buttonindex == datas['questions'][pageindex]['correctIndex']
        ? match = true
        : match = false;

    notifyListeners();

    if (match) {
      mark = mark + 20;
      match = false;
    }
    notifyListeners();
  }
}
