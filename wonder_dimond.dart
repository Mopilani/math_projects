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

  try {
    var y_rotation_value = 0;
    var x_rotation_value = 0;
    var y_clamping = true;
    var x_clamping = true;
    for (var i = 0; i < (loops ??= 4140); i++) {
      // print('$y_rotation_value - $x_rotation_value');
      // Y rotation value sumation
      if (y_rotation_value < 180 && y_clamping) {
        y_rotation_value++;
      } else if (y_rotation_value <= 180) {
        y_clamping = false;
        if (y_rotation_value == 0) {
          y_clamping = true;
        } else {
          y_rotation_value--;
        }
      }

      // X rotation value sumation
      if (x_rotation_value < 180 && x_clamping) {
        x_rotation_value++;
      } else if (x_rotation_value <= 180) {
        x_clamping = false;
        if (x_rotation_value == 0) {
          x_clamping = true;
        } else {
          x_rotation_value--;
        }
      }

      rotat_on_y(x) {
        var f = y_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around y axis
        var val = math.cos(x) * math.sin(f);
        return val;
      }

      // print('$y_rotation_value - $x_rotation_value');

      rotat_on_x(y) {
        var f = -x_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
        var val = math.sin(y) * math.cos(f);
        return val;
      }

      specificCircle([int? dimeter]) {
        addCircle(
          dimeterHalf: dimeter ??= 15,
          // char: _coloredString('0'),
          char: '0',
          screenWidth: screenWidth,
          framPixels: framPixels,
          def1: rotat_on_y,
          def2: rotat_on_x,
          rotated_on_x: x_clamping,
          rotated_on_y: y_clamping,
          screenHeight: screenHeight,
        );
      }

      specificCircle(12);
      specificCircle(13);
      specificCircle(14);
      specificCircle();

      fram = framPixels.join();
      render(fram);
    }
  } catch (e) {
    print(e);
  }

  // fram = framPixels.join();
  // render(fram);
}

class Shape {
  String char = '0';
  num dimeterHalf = 1;
  Function? def1;
  Function? def2;
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

    int purposeIndex = (py + px).round();

    // print('$x - $y');

    try {
      if (x.isNegative && y.isNegative) {
        if (rotated_on_x) {
          framPixels[purposeIndex] = '4';
        } else {
          framPixels[purposeIndex] = '.';
        }
      } else if (x.isNegative) {
        if (!y.isNegative) {
          if (rotated_on_x) {
            framPixels[purposeIndex] = '.';
          } else {
            framPixels[purposeIndex] = '1';
          }
        }
        // continue;
      } else if (!x.isNegative && !y.isNegative) {
        if (rotated_on_x) {
          framPixels[purposeIndex] = '4';
        } else {
          framPixels[purposeIndex] = '.';
        }
      } else if (!x.isNegative) {
        if (y.isNegative) {
          if (rotated_on_x) {
            framPixels[purposeIndex] = '.';
          } else {
            framPixels[purposeIndex] = '2';
          }
        }
        // continue;
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
