import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHadesProvider extends ChangeNotifier {
  List<String> titles = [];
  List<List<String>> contents = [];

  readFile() async {
    String res = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> titlesRes = [];
    List<List<String>> contentRes = [];
    List<String> hadethAll = res.trim().split('#');
    for (int i = 0; i < hadethAll.length; i++) {
      String singleHadeth = hadethAll[i];
      List<String> hadethContent = singleHadeth.trim().split('\r\n');
      String title = hadethContent[0];
      titlesRes.add(title);
      hadethContent.removeAt(0);
      List<String> content = hadethContent;
      contentRes.add(content);
    }
    titles = titlesRes;
    contents = contentRes;
  }
}
