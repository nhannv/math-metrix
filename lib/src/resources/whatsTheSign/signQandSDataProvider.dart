import 'package:mathgame/src/models/whatsTheSign/SignQandS.dart';
import 'package:mathgame/src/utility/mathUtil.dart';

class SignQandSDataProvider {
  static getSignDataList(int level) {
    List<SignQandS> list = List();

    int i = 0;
    int min = 3;
    min = min < 1 ? 1 : min;
    int max = 10;

    while (i < 5) {
      int x1 = MathUtil.generateRandomAnswer(min, max);
      String x2 = MathUtil.generateRandomSign();
      int x3 = MathUtil.generateRandomAnswer(min, max);
      if (MathUtil.evaluate(x1, x2, x3) > 0 &&
          !list.contains(SignQandS(1, x1.toString(), x2, x3.toString(),
              MathUtil.evaluate(x1, x2, x3).toString()))) {
        if ((x2 == "/" && x1 > x3 && x1 % x3 == 0) || x2 != "/") {
          list.add(SignQandS(1, x1.toString(), x2, x3.toString(),
              MathUtil.evaluate(x1, x2, x3).toString()));
          print("$x1 $x2 $x3 = ${MathUtil.evaluate(x1, x2, x3)}");
        }
        i++;
      }
    }
    return list;
  }
}
