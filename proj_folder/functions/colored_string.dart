import 'dart:math' as math;

import '../utils/data_lists.dart';
import '../utils/enums.dart';

String coloredString(String string, {Colors? colorState, int? colorNumber}) {
  var colorsList = [];
  // print(colorState);

  if (colorState == Colors.standerd) {
    colorsList = standerdColors;
  } else if (colorState == Colors.standeredLitening) {
    colorsList = filledColorsList;
  } else if (colorState == Colors.filled) {
    colorsList = filledColorsLiteningList;
  } else if (colorState == Colors.filledLitening) {
    colorsList = liteningColors;
  } else if (colorState == Colors.any) {
    colorsList = allColors;
  } else {
    colorsList = allColors;
  }
  var random = math.Random();
  if (colorNumber != null) {
    return '\u001b[$colorNumber\m$string\u001b[0m';
  } else {
    return '\u001b[${colorsList[random.nextInt(colorsList.length)]}m$string\u001b[0m';
  }
}
