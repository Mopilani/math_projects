import 'dart:math' as math;

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
