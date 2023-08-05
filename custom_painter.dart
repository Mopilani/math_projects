import 'dart:math' as math;
import 'dart:io';

int selector({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
  var sl = y * screenWidth;
  var r = sl + x;
  return r.round();
}

int selectorfromCenter({double x = 0.0, double y = 0.0, int screenWidth = 0}) {
  var sl = y * screenWidth;
  var r = sl + x;
  return r.round();
}

dynamic addShape({
  String char = '\$',
  math.Point? center,
  num dimeterHalf = 10,
  Function? def1,
  Function? def2,
  List<String>? framPixels,
  int screenWidth = 0,
  int screenHeight = 0,
  num fromWidth = .5,
  num fromHeight = .5,
}) {
  if (center == null) {
    // print('Center is $center');
    center = math.Point(0, 0);
  }
  for (var i = 0; i < 361; i++) {
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

    // x mutliple half dimeter
    var xmhd = x *
        dimeterHalf *
        2; // "*2" to resolove the terminal screen width by height

    /// Width half
    var widthHalf = screenWidth * fromWidth;
    // purpose pixel
    var px = (xmhd + widthHalf);

    // y mutliple half dimeter
    var ymhd = i * dimeterHalf;

    /// Height half
    var heightHalf = screenHeight * fromHeight;
    var realY = heightHalf + ymhd;
    // purpose pixel
    var py = screenWidth * realY.round();

    int purposeIndex = (py + px).round();

    try {
      framPixels![purposeIndex] = char;
    } catch (e) {
      // print(e);
    }
  }
}

num thinker(x, c) {
  if (x > c * 2) {
    return x / 2;
  } else if (x > c * 3) {
    return x / 3;
  } else if (x > c * 4) {
    return x / 4;
  } else if (x > c * 5) {
    return x / 5;
  } else if (x > c * 6) {
    return x / 6;
  } else if (x > c * 7) {
    return x / 7;
  } else if (x > c * 8) {
    return x / 8;
  } else if (x > c * 9) {
    return x / 9;
  } else if (x > c * 10) {
    return x / 10;
  } else {
    return x;
  }
}

void main(List<String> args) {
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

  void render(fram) => stdout.write(fram);

  String fram = ' ';

  var filledFrame = fram * (screenWidth * screenHeight);
  var framPixels = filledFrame.split('');

  // f(x) {
  //   var val = math.cos(x);
  //   var r = val.riseToThePower(4) + 2 * val.riseToThePower(5) + val;
  //   return r;
  // }

  // d(x) {
  //   var val = math.tan(x);
  //   var r = val.riseToThePower(4) + 2 * val.riseToThePower(25) + val;
  //   return r;
  // }

  // dd(x) {
  //   var val = math.cos(x) * math.sin(x);
  //   var r = val.riseToThePower(x) + x * val.riseToThePower(x) + val;
  //   return r;
  // }

  int? loops;
  num? dimeter;
  try {
    loops = int.parse(args[0]);
    dimeter = num.parse(args[1]);
  } catch (e) {}
  String _coloredString(String string) {
    var colorsNumbers = <int>[
      4,
      7,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      91,
      92,
      93,
      94,
      95,
      96,
      97,
      101,
      102,
      103,
      104,
      105,
      106,
      107
    ];

    var random = math.Random();
    return '\u001b[${colorsNumbers[random.nextInt(colorsNumbers.length)]}m$string\u001b[0m';
  }

  chose(int i) {
    return i < 500
        ? i < 1000
            ? i < 1500
                ? i < 2000
                    ? i < 2500
                        ? i < 3000
                            ? i < 3500
                                ? i < 4000
                                    ? i < 4500
                                        ? i < 5000
                                            ? i < 5500
                                                ? i < 6000
                                                    ? .000001
                                                    : .000001
                                                : .0000001
                                            : .000001
                                        : .000001
                                    : .000001
                                : .00001
                            : .00001
                        : .0001
                    : .0001
                : .0001
            : .001
        : .001;
  }

  try {
    for (var i = 0; i < (loops ??= 10000); i++) {
      rotat_on_y(x) {
        var f = i * .0000001 * i;
        var r = f + .5;
        var val = math.cos(x) * math.cos(r);
        return val;
      }

      rotat_on_x(y) {
        var f = i * .000001 * i;
        var r = 1 - f;
        var val = math.sin(y) * math.sin(r);
        return val;
      }

      specificCircle(int? dimeter) {
        addCircle(
          dimeterHalf: dimeter ??= 15,
          // char: _coloredString('0'),
          char: '0',
          screenWidth: screenWidth,
          framPixels: framPixels,
          def1: rotat_on_y,
          def2: rotat_on_x,
          screenHeight: screenHeight,
        );
      }

      // specificCircle(10);
      // specificCircle(11);
      specificCircle(12);
      specificCircle(13);
      specificCircle(14);
      specificCircle(15);

      // framPixels = addCircle(
      //   dimeterHalf: dimeter ??= 15,
      //   // char: _coloredString('0'),
      //   char: i > 90
      //       ? i > 180
      //           ? i > 270
      //               ? i > 360
      //                   ? i > 450
      //                       ? i > 540
      //                           ? i > 630
      //                               ? i > 720
      //                                   ? i > 810
      //                                       ? i > 900
      //                                           ? i > 990
      //                                               ? i > 1080
      //                                                   ? '0'
      //                                                   : '0'
      //                                               : '0'
      //                                           : '0'
      //                                       : '0'
      //                                   : '0'
      //                               : '0'
      //                           : '0'
      //                       : '0'
      //                   : '0'
      //               : '0'
      //           : '0'
      //       : '0',
      //   screenWidth: screenWidth,
      //   framPixels: framPixels,
      //   def1: rotat_on_y,
      //   def2: rotat_on_x,
      //   screenHeight: screenHeight,
      // );

      // framPixels[i] = "\u001B[$i\m0\u001b[0m";
      fram = framPixels.join();
      render(fram);

      fram = ' ';
      filledFrame = fram * (screenWidth * screenHeight);
      framPixels = filledFrame.split('');
      // addShape(
      //     dimeterHalf: i,
      //     def1: math.sin,
      //     def2: math.sin,
      //     char: i > 90
      //         ? i > 180
      //             ? i > 270
      //                 ? i > 360
      //                     ? i > 450
      //                         ? i > 540
      //                             ? i > 630
      //                                 ? i > 720
      //                                     ? i > 810
      //                                         ? i > 900
      //                                             ? i > 990
      //                                                 ? i > 1080
      //                                                     ? i.isEven
      //                                                         ? i.isOdd
      //                                                             ? '1'
      //                                                             : '.'
      //                                                         : '1'
      //                                                     : '.'
      //                                                 : '0'
      //                                             : '.'
      //                                         : '0'
      //                                     : '.'
      //                                 : '0'
      //                             : '.'
      //                         : '1'
      //                     : '.'
      //                 : '0'
      //             : '.'
      //         : '0',
      //     framPixels: framPixels,
      //     screenHeight: screenHeight,
      //     screenWidth: screenWidth,
      //     fromHeight: thinker(i, 180) * .01,
      //     fromWidth: thinker(i, 180) * .01);
      // i > 100
      //     ? addShape(
      //         dimeterHalf: i / 2,
      //         def1: math.cos,
      //         def2: math.cos,
      //         char: i > 90
      //             ? i > 180
      //                 ? i > 270
      //                     ? i > 360
      //                         ? i > 450
      //                             ? i > 540
      //                                 ? i > 630
      //                                     ? i > 720
      //                                         ? i > 810
      //                                             ? i > 900
      //                                                 ? i > 990
      //                                                     ? i > 1080
      //                                                         ? i.isEven
      //                                                             ? i.isOdd
      //                                                                 ? '1'
      //                                                                 : '.'
      //                                                             : '1'
      //                                                         : '.'
      //                                                     : '0'
      //                                                 : '.'
      //                                             : '0'
      //                                         : '.'
      //                                     : '0'
      //                                 : '.'
      //                             : '1'
      //                         : '.'
      //                     : '0'
      //                 : '.'
      //             : '0',
      //         framPixels: framPixels,
      //         screenHeight: screenHeight,
      //         screenWidth: screenWidth,
      //         fromHeight: thinker(i, 180) * .01,
      //         fromWidth: thinker(i, 180) * .01)
      //     : null;

      // addShape(
      //     dimeterHalf: i,
      //     def1: math.sin,
      //     def2: math.sin,
      //     char: i > 90
      //         ? i > 180
      //             ? i > 270
      //                 ? i > 360
      //                     ? i > 450
      //                         ? i > 540
      //                             ? i > 630
      //                                 ? i > 720
      //                                     ? i > 810
      //                                         ? i > 900
      //                                             ? i > 990
      //                                                 ? i > 1080
      //                                                     ? i.isEven
      //                                                         ? i.isOdd
      //                                                             ? ' '
      //                                                             : ' '
      //                                                         : ' '
      //                                                     : ' '
      //                                                 : ' '
      //                                             : ' '
      //                                         : ' '
      //                                     : ' '
      //                                 : ' '
      //                             : ' '
      //                         : ' '
      //                     : ' '
      //                 : ' '
      //             : ' '
      //         : ' ',
      //     framPixels: framPixels,
      //     screenHeight: screenHeight,
      //     screenWidth: screenWidth,
      //     fromHeight: thinker(i, 180) * .01,
      //     fromWidth: thinker(i, 180) * .01);

      // i > 100
      //     ? addShape(
      //         dimeterHalf: i / 2,
      //         def1: math.cos,
      //         def2: math.cos,
      //         char: i > 90
      //             ? i > 180
      //                 ? i > 270
      //                     ? i > 360
      //                         ? i > 450
      //                             ? i > 540
      //                                 ? i > 630
      //                                     ? i > 720
      //                                         ? i > 810
      //                                             ? i > 900
      //                                                 ? i > 990
      //                                                     ? i > 1080
      //                                                         ? i.isEven
      //                                                             ? i.isOdd
      //                                                                 ? ' '
      //                                                                 : ' '
      //                                                             : ' '
      //                                                         : ' '
      //                                                     : ' '
      //                                                 : ' '
      //                                             : ' '
      //                                         : ' '
      //                                     : ' '
      //                                 : ' '
      //                             : ' '
      //                         : ' '
      //                     : ' '
      //                 : ' '
      //             : ' ',
      //         framPixels: framPixels,
      //         screenHeight: screenHeight,
      //         screenWidth: screenWidth,
      //         fromHeight: thinker(i, 180) * .01,
      //         fromWidth: thinker(i, 180) * .01)
      //     : null;

      // framPixels = ''.split('');
    }
  } catch (e) {
    print(e);
  }

  fram = framPixels.join();
  render(fram);
}

class Shape {
  String char = '0';
  // math.Point? center;
  num dimeterHalf = 1;
  Function? def1;
  Function? def2;
  // List<String> framPixels = [];
  int screenHeight = 0;
  int screenWidth = 0;
  num fromHeight = 2;
  num fromWidth = 2;

  Shape fromMap(Map shapeData) {
    dimeterHalf = shapeData['dimeterHalf'];
    fromHeight = shapeData['fromHeight'];
    fromWidth = shapeData['fromWidth'];
    char = shapeData['char'];
    return this;
  }

  Map<String, dynamic> toMap(Map shapeData) => {
        'dimeterHalf': dimeterHalf,
        'fromHeight': fromHeight,
        'fromWidth': fromWidth,
        'char': char,
      };
}

double circleDef(x, y, d, h) {
  var fo = x - d;
  var fosqr = fo * fo;
  var so = y - h;
  var sosqr = so * so;

  var result = fosqr + sosqr;
  return result;
}

extension RaiseTO on num {
  num riseToThePower(num power) {
    var r = this;
    for (var i = 0; i < power; i++) {
      r = r * this;
    }
    return r;
  }
}

List<String> addCircle(
    {String char = '\$',
    math.Point? center,
    num dimeterHalf = 10,
    Function? def1,
    Function? def2,
    int screenWidth = 0,
    int screenHeight = 0,
    framPixels}) {
  // for 360 deg
  for (var i = 0; i < 361; i++) {
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

    int purposeIndex = (py + px).round();

    // print('$x - $y');

    try {
      if (x.isNegative && y.isNegative) {
        if (x < -.000000001 && y < -.000000000001) {
          framPixels[purposeIndex] = '.';
        } else {
          framPixels[purposeIndex] = '4';
        }
      } else if (x.isNegative) {
        if (!y.isNegative) {
          framPixels[purposeIndex] = '1';
        }
        continue;
      } else if (y.isNegative) {
        if (!x.isNegative) {
          framPixels[purposeIndex] = '2';
        }
        continue;
      } else if (!x.isNegative && !y.isNegative) {
        framPixels[purposeIndex] = '3';
      }

      // framPixels[purposeIndex] = (x.isNegative && !y.isNegative
      //     ? x < 0
      //         ? '.'
      //         : char
      //     : (!x.isNegative && y.isNegative
      //         ? (y < 1 ? char : (x > 0 ? '.' : char))
      //         : char));
    } catch (e) {
      // print(e);
    }
  }
  return framPixels;
}

// xxx(num x) {
//   var val = (x);
//   var r =  val.riseToThePower(1) + 0.0001 * val.riseToThePower(1) + val;
//   return r;
// }

// yyy(num x) {
//   // var val = math.cos(x);
//   // var r =  100 * val.riseToThePower(5) + 10 * val.riseToThePower(2) + val;
//   // print(r);
//   return x;
// }


/// One - Zero chars for < 1080 > infinity
        // char: i > 90
        //     ? i > 180
        //         ? i > 270
        //             ? i > 360
        //                 ? i > 450
        //                     ? i > 540
        //                         ? i > 630
        //                             ? i > 720
        //                                 ? i > 810
        //                                     ? i > 900
        //                                         ? i > 990
        //                                             ? i > 1080
        //                                                 ? i.isEven
        //                                                     ? i.isOdd
        //                                                         ? '1'
        //                                                         : '0'
        //                                                     : '1'
        //                                                 : '1'
        //                                             : '0'
        //                                         : '1'
        //                                     : '0'
        //                                 : '1'
        //                             : '0'
        //                         : '1'
        //                     : '1'
        //                 : '1'
        //             : '0'
        //         : '1'
        //     : '0',


        
      // addShape(
      //     dimeterHalf: 100,
      //     def1: math.cos,
      //     def2: math.sin,
      //     char: i > 10 ? (i > 25 ? 'o' : '0') : '\$',
      //     framPixels: framPixels,
      //     screenHeight: screenHeight,
      //     screenWidth: screenWidth,
      //     fromHeight:  .5,
      //     fromWidth: .5);
      // addShape(
      //   dimeterHalf: 100,
      //   // def1: math.cos,
      //   // def2: math.sin,
      //   char: '0',
      //   framPixels: framPixels,
      //   screenHeight: screenHeight,
      //   screenWidth: screenWidth,
      // )
      // addShape(
      //     dimeterHalf: 1,
      //     def1: xxx,
      //     def2: yyy,
      //     char: i > 10 ? (i > 25 ? 'o' : '0') : '0',
      //     framPixels: framPixels,
      //     screenHeight: screenHeight,
      //     screenWidth: screenWidth,
      //     fromHeight: .1,
      //     fromWidth: .35);
      // addShape(
      //   dimeterHalf: 100,
      //   // def1: math.cos,
      //   // def2: math.sin,
      //   char: '0',
      //   framPixels: framPixels,
      //   screenHeight: screenHeight,
      //   screenWidth: screenWidth,
      // );
      // addCircle(dimeterHalf: i, def1: f, def2: d, char: i > 10 ? '.' : '.');
      

      
        // char: i > 90
        //     ? i > 180 && i.isOdd
        //         ? i > 270 && i.isOdd
        //             ? i > 360 && i.isOdd
        //                 ? i > 450 && i.isOdd
        //                     ? i > 540 && i.isOdd
        //                         ? i > 630 && i.isOdd
        //                             ? i > 720 && i.isOdd
        //                                 ? i > 810 && i.isOdd
        //                                     ? i > 900 && i.isOdd
        //                                         ? i > 990 && i.isOdd
        //                                             ? i > 1080 && i.isOdd
        //                                                 ? i.isEven
        //                                                     ? i.isOdd
        //                                                         ? _coloredString(
        //                                                             '*')
        //                                                         : _coloredString(
        //                                                             ':')
        //                                                     : _coloredString(
        //                                                         '0')
        //                                                 : _coloredString('.')
        //                                             : _coloredString('0')
        //                                         : _coloredString('.')
        //                                     : _coloredString('0')
        //                                 : _coloredString('.')
        //                             : _coloredString('0')
        //                         : _coloredString('.')
        //                     : _coloredString('0')
        //                 : _coloredString('.')
        //             : _coloredString('0')
        //         : _coloredString('.')
        //     : _coloredString('0'),
        // char: _coloredString(
        //   i > 90
        //       ? i > 180
        //           ? i > 270
        //               ? i > 360
        //                   ? i > 450
        //                       ? i > 540
        //                           ? i > 630
        //                               ? i > 720
        //                                   ? i > 810
        //                                       ? i > 900
        //                                           ? i > 990
        //                                               ? i > 1080
        //                                                   ? i.isEven
        //                                                       ? i.isOdd
        //                                                           ? '.'
        //                                                           : '*'
        //                                                       : '*'
        //                                                   : '.'
        //                                               : '*'
        //                                           : '.'
        //                                       : '*'
        //                                   : '.'
        //                               : '*'
        //                           : '.'
        //                       : '*'
        //                   : '.'
        //               : '*'
        //           : '.'
        //       : '*',
        // ),