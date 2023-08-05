import 'dart:io';
import 'dart:math' as math;

int selector({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
  // var intx = x.round();
  // var inty = y.round();

  var sl = y * screenWidth;
  var r = sl + x;
  return r.round();
}

int selectorfromCenter({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
  var sl = y * screenWidth;
  var r = sl + x;
  return r.round();
}

void main() {
  int screenHeight = 0;
  int screenWidth = 0;
  try {
    screenHeight = stdout.terminalLines;
    screenWidth = stdout.terminalColumns.isOdd
        ? stdout.terminalColumns - 1
        : stdout.terminalColumns;
  } catch (e) {
    print(e);
  }

  void render(fram) => print(fram);
  var fram = ' ';

  var filledFrame = fram * (screenWidth * screenHeight);
  var framPixels = filledFrame.split('');

  dynamic addCircle(
      {String char = '\$',
      math.Point? center,
      num dimeterHalf = 20,
      Function? def1,
      Function? def2}) {
    double sin;
    double cos;
    if (center == null) {
      // print('Center is $center');
      center = math.Point(0, 0);
    }
    for (var i = 0; i < 360; i++) {
      var x;
      var y;
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

      // var dimeterHalf = 2;
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

      int purposeIndex = (py + px).round();
      framPixels[purposeIndex] = char;

      // try {
      //   if (sin.isNegative) {
      //     sin = sin * -1;
      //     if (cos.isNegative) {
      //       cos = cos * -1;
      //       framPixels[selector(x: sin * 10, y: cos * 10)] = "\$";
      //     }
      //   }
      // } catch (e) {
      //   print(e);
      //   framPixels[selector(x: sin * 10, y: cos * -10)] = "\$";
      // }
      // x + 1;
      // y + 1;
    }
    //   fram = framPixels.join();

    //   render(fram);
    // }
  }

  /// filling the fram
  // for (var i = 0; i < screenWidth; i++) {
  //   if (i == screenWidth / 2) {
  //     var currentPixel = screenWidth * (screenHeight / 2).round();
  //     framPixels[currentPixel + i] = '-';
  //   } else {
  //     var currentPixel = screenWidth * (screenHeight / 2).round();
  //     framPixels[currentPixel + i] = '-';
  //   }
  // }

  // bool firstWidth = true;
  // var currentP = 0;
  // for (var i = 0; i < screenHeight; i++) {
  //   if (firstWidth) {
  //     var currentPixel = (screenWidth / 2).round();
  //     currentP = currentPixel;
  //     framPixels[currentPixel] = '|';
  //     // print(currentPixel);
  //     firstWidth = false;
  //   } else if (!firstWidth && currentP <= framPixels.length) {
  //     var currentPixel = currentP + screenWidth;

  //     currentP = currentPixel;
  //     framPixels[selector(x: screenWidth / 2, y: i.toDouble())] = '|';
  //   }
  // }
  // }

  try {
    // framPixels[selector(x: screenWidth * .5, y: screenHeight * .5)] = '0';
    for (var i = 0; i < 20; i++) {
      addCircle(dimeterHalf: i, def1: math.tan, def2: math.sin);
      // addCircle();
      // if (i == 2 || i == 5 || i == 6 || i == 10 || i == 11 || i == 12 || i == 18) {
      // } else {
      // }
    }
  } catch (e) {
    print(e);
  }

  fram = framPixels.join();

  render(fram);
}

extension BackTo on List {
  getPixelFromCenter(
      {double x = 0.0,
      double y = 0.0,
      screenWidth,
      screenHeight,
      Object object = ' '}) {
    // if (x.isNegative || y.isNegative) {
    //   var sl = (y * 2) * screenWidth;
    //   r = sl + (x * 100);
    //   ni = selector(x: center.x, y: center.y, screenWidth: screenWidth) +
    //       r.round();
    //   // print('Negative: x = $nx | y = $ny');
    //   // print('Current index = $ni');
    // } else {
    //   var sl = (y * 2) * screenWidth;
    //   r = sl + (x * 100);
    //   ni = selector(x: center.x, y: center.y, screenWidth: screenWidth) +
    //       r.round();
    //   // print('Current index Not Negative = $ni');
    // }

    // this[ni] = object;

    // return r.round();
  }

  getPixelFromCenterfULL(
      {double x = 0.0,
      double y = 0.0,
      screenWidth,
      screenHeight,
      Object object = ' ',
      int my = 0}) {
    var center = math.Point<double>(screenWidth / 2, screenHeight / 2);
    var ni;
    var r;

    if (x.isNegative || y.isNegative) {
      var sl = (y * my * .0001) * screenWidth;
      r = sl + (x * 100);
      ni = selector(x: center.x, y: center.y, screenWidth: screenWidth) +
          r.round();
      // print('Negative: x = $nx | y = $ny');
      // print('Current index = $ni');
    } else {
      var sl = (y * (my > 7390 ? my * 0.003 : my)) * screenWidth;
      r = sl + (x * 100);
      ni = selector(x: center.x, y: center.y, screenWidth: screenWidth) +
          r.round();
      // print('Current index Not Negative = $ni');
    }

    this[ni] = object;

    return r.round();
  }
  // int selector({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
  //   var intx = x.round();
  //   var inty = y.round();

  //   if (x.isNegative || y.isNegative) {
  //   } else {}

  //   var sl = y * screenWidth;
  //   var r = sl + x;
  //   return r.round();
  // }/
}

double sumDef(x, y, d, h) {
  var fo = x - d;
  var fosqr = fo * fo;
  var so = y - h;
  var sosqr = so * so;

  var result = fosqr + sosqr;
  return result;
}

// var d = (screenWidth / 2).round() * (screenWidth / 2).round();

// framPixels[(framPixels.length / 2 + screenWidth / 2).round()] = '0';

//   var result = sumDef(sin, cos, 0, 0);
//   print(result);
// print(currentPixel);
// print(currentP);
// try {
// } catch (e) {
// print(e);
// }

// var rect = math.Rectangle.fromPoints(math.Point(4, 4), math.Point(5, 7));
// print(rect.height);
// var p = Platform.operatingSystem;
// var skipLines = inty * screenWidth;
// var result = skipLines + intx;
// print(y);
// print(sl);
// print(x);
// var screenWidth =
// print(p);
// var point;
// framPixels.insert(currentPixel + i, '+');
// framPixels.insert(currentPixel + i, '-');
// print('insrt')


// import 'dart:io';
// import 'dart:math' as math;

// int selector({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
//   var intx = x.round();
//   var inty = y.round();

//   var sl = y * screenWidth;
//   var r = sl + x;
//   return r.round();
// }

// void main() {
//   int screenHeight = stdout.terminalLines;
//   int screenWidth = stdout.terminalColumns.isOdd
//       ? stdout.terminalColumns - 1
//       : stdout.terminalColumns;

//   void render(fram) => print(fram);

//   // String circlePath(ng) {
//   //   ng +
//   // }

//   var fram = ' ';

//   var filledFrame = fram * (screenWidth * screenHeight);
//   var framPixels = filledFrame.split('');

//   dynamic addCircle() {
//     double sin;
//     double cos;

//     for (var i = 0; i < 361; i++) {
//       sin = math.sin(i);
//       cos = math.cos(i);

//       framPixels.getPixelFromCenter(
//           x: sin,
//           y: cos,
//           screenHeight: screenHeight,
//           screenWidth: screenWidth,
//           object: '\$');
//       // try {
//       //   if (sin.isNegative) {
//       //     sin = sin * -1;
//       //     if (cos.isNegative) {
//       //       cos = cos * -1;
//       //       framPixels[selector(x: sin * 10, y: cos * 10)] = "\$";
//       //     }
//       //   }
//       // } catch (e) {
//       //   print(e);
//       //   framPixels[selector(x: sin * 10, y: cos * -10)] = "\$";
//       // }
//       // x + 1;
//       // y + 1;
//     }
//   }

//   /// filling the fram
//   for (var i = 0; i < screenWidth; i++) {
//     if (i == screenWidth / 2) {
//       var currentPixel = screenWidth * (screenHeight / 2).round();
//       framPixels[currentPixel + i] = '-';
//     } else {
//       var currentPixel = screenWidth * (screenHeight / 2).round();
//       framPixels[currentPixel + i] = '-';
//     }
//   }

//   bool firstWidth = true;
//   var currentP = 0;
//   for (var i = 0; i < screenHeight; i++) {
//     if (firstWidth) {
//       var currentPixel = (screenWidth / 2).round();
//       currentP = currentPixel;
//       framPixels[currentPixel] = '|';
//       // print(currentPixel);
//       firstWidth = false;
//     } else if (!firstWidth && currentP <= framPixels.length) {
//       var currentPixel = currentP + screenWidth;

//       currentP = currentPixel;
//       framPixels[selector(x: screenWidth / 2, y: i.toDouble())] = '|';
//     }
//   }
//   // }

//   try {
//     framPixels[selector(x: (screenWidth * 0.506), y: screenHeight * .5)] = '0';
//     addCircle();
//   } catch (e) {
//     print(e);
//   }

//   fram = framPixels.join();

//   render(fram);
// }

// extension BackTo on List {
//   getPixelFromCenter(
//       {double x = 0.0,
//       double y = 0.0,
//       screenWidth,
//       screenHeight,
//       Object object = ' '}) {
//     var center = math.Point<double>(screenWidth / 2, screenHeight / 2);

//     var intx = x.round();
//     var inty = y.round();
//     var nx;
//     var ny;
//     var r;

//     if (x.isNegative || y.isNegative) {
//       nx = center.x + x;
//       ny = center.y + y;
//       var sl = ny * screenWidth;
//       r = sl + nx;
//       // print('Negative: x = $nx | y = $ny');
//       print('Current index = $sl');
//     } else {
//       var sl = y * screenWidth;
//       r = sl + x;
//       print('Current index Not Negative = $sl');
//     }

//     this[r.round()] = object;

//     return r.round();
//   }

//   int selector({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
//     var intx = x.round();
//     var inty = y.round();

//     if (x.isNegative || y.isNegative) {
//     } else {}

//     var sl = y * screenWidth;
//     var r = sl + x;
//     return r.round();
//   }
// }

// double sumDef(x, y, d, h) {
//   var fo = x - d;
//   var fosqr = fo * fo;
//   var so = y - h;
//   var sosqr = so * so;

//   var result = fosqr + sosqr;
//   return result;
// }

// // var d = (screenWidth / 2).round() * (screenWidth / 2).round();

// // framPixels[(framPixels.length / 2 + screenWidth / 2).round()] = '0';

// //   var result = sumDef(sin, cos, 0, 0);
// //   print(result);
// // print(currentPixel);
// // print(currentP);
// // try {
// // } catch (e) {
// // print(e);
// // }

// // var rect = math.Rectangle.fromPoints(math.Point(4, 4), math.Point(5, 7));
// // print(rect.height);
// // var p = Platform.operatingSystem;
// // var skipLines = inty * screenWidth;
// // var result = skipLines + intx;
// // print(y);
// // print(sl);
// // print(x);
// // var screenWidth =
// // print(p);
// // var point;
// // framPixels.insert(currentPixel + i, '+');
// // framPixels.insert(currentPixel + i, '-');
// // print('insrt')
