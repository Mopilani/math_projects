import 'dart:math' as math;

import '../functions/colored_string.dart';

List<String> addCircle(
    {String char = '\$',
    math.Point? center,
    num dimeterHalf = 10,
    Function? def1,
    Function? def2,
    int screenWidth = 0,
    int screenHeight = 0,
    framPixels,
    bool rotated_on_x = false,
    bool rotated_on_y = false}) {
  // for 360 deg
  for (var i = 0; i < 360; i++) {
    double x;
    double y;
    if (def1 != null) {
      x = def1(i);
    } else {
      x = math.cos(i);
    }

    if (def2 != null) {
      y = def2(i);
    } else {
      y = math.sin(i);
    }

    // x mutliple half dimeter
    var xmhd = x *
        dimeterHalf *
        2; // "*2" to resolove the terminal screen width by height

    /// Width half
    var widthHalf = screenWidth / 2;

    // purpose pixel
    var px = (xmhd + widthHalf);

    // y mutliple half dimeter
    var ymhd = y * dimeterHalf;

    /// Height half
    var heightHalf = screenHeight / 2;
    var realY = heightHalf + ymhd;
    // purpose pixel
    var py = screenWidth * realY.round();

    var someFromWidth = heightHalf * screenWidth + screenWidth * .1;

    int purposeIndex = (py + px).round();

    try {
      if (x.isNegative && y.isNegative) {
        // ---------------------------
        if (!rotated_on_x) {
          framPixels[purposeIndex] = coloredString('0');
        } else {
          framPixels[purposeIndex] = coloredString('.');
        }
      } else if (x.isNegative) {
        if (!y.isNegative) {
          // ---------------------------
          if (rotated_on_x) {
            framPixels[purposeIndex] = coloredString('0');
          } else {
            framPixels[purposeIndex] = coloredString('.');
          }
        }
      } else if (!x.isNegative && !y.isNegative) {
        // ---------------------------
        if (!rotated_on_x) {
          framPixels[purposeIndex] = coloredString('0');
        } else {
          framPixels[purposeIndex] = coloredString('.');
        }
      } else if (!x.isNegative) {
        if (y.isNegative) {
          // ---------------------------
          if (rotated_on_x) {
            framPixels[purposeIndex] = coloredString('0');
          } else {
            framPixels[purposeIndex] = coloredString('.');
          }
        }
      }
    } catch (e) {
      // print(e);
    }
  }
  return framPixels;
}
