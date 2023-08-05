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
  String fram = ' ';

  var filledFrame = fram * (screenWidth * screenHeight);
  var framPixels = filledFrame.split('');

  f(x) {
    var val = math.sin(x) * math.tan(x);
    var r = val.riseToThePower(4) + 2 * val.riseToThePower(5) + val;
    return r;
  }

  d(x) {
    var val = math.tan(x);
    var r = val.riseToThePower(4) + 2 * val.riseToThePower(25) + val;
    return r;
  }

  dd(x) {
    var val = math.cos(x) * math.sin(x);
    var r = val.riseToThePower(x) + x * val.riseToThePower(x) + val;
    return r;
  }

  // num x_rotaion_value = 0;
  // num y_rotaion_value = 1;

  try {
    for (var i = 1; i < 10000; i++) {
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
      rotat_on_y(x) {
        var f = i * .001 * i;
        var r = f * f + .01;
        var val = math.cos(x) * math.sin(r);
        return val;
      }

      rotat_on_x(y) {
        var f = i * .009 * i;
        var r = f * f - .01;
        var val = math.sin(y) * math.cos(r);
        return val;
      }

      framPixels = addCircle(
        dimeterHalf: i > 360
            ? i > 720
                ? i > 2080
                    ? i / 5
                    : i / 4
                : i / 3
            : i / 2,
        // char:
        char: i > 90
            ? i > 180
                ? i > 270
                    ? i > 360
                        ? i > 450
                            ? i > 540
                                ? i > 630
                                    ? i > 720
                                        ? i > 810
                                            ? i > 900
                                                ? i > 990
                                                    ? i > 1080
                                                        ? i.isEven
                                                            ? i.isOdd
                                                                ? '.'
                                                                : '0'
                                                            : '.'
                                                        : '1'
                                                    : '0'
                                                : '1'
                                            : '0'
                                        : '1'
                                    : '0'
                                : '1'
                            : '1'
                        : '1'
                    : '0'
                : '1'
            : '0',
        screenWidth: screenWidth,
        framPixels: framPixels,
        def1: rotat_on_y,
        def2: rotat_on_x,
        screenHeight: screenHeight,
      );
      fram = framPixels.join();
      render(fram);
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

    try {
      framPixels[purposeIndex] = char;
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
