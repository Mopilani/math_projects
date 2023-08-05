import 'dart:math' as math;

dynamic add3DShape(
    {String char = '\$',
    num dimeterHalf = 10,
    Function? def1,
    Function? def2,
    Function? def3,
    List<String>? framPixels,
    int screenWidth = 0,
    int screenHeight = 0,
    num fromWidth = .5,
    num fromHeight = .5,
    num x_rotation_on_y = 0,
    num y_rotation_on_x = 0,
    num z_rotation_on_y = 0,
    bool rotated_on_x = false,
    bool rotated_on_y = false}) {
  for (var i = 0; i < 50; i++) {
    var x;
    var y;
    var z;
    if (def1 != null) {
      x = def1(i, y_rotation_on_x);
    } else {
      var rotationValue = -y_rotation_on_x *
          .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
      x = math.cos(i) * math.sin(rotationValue);
    }
    if (def2 != null) {
      y = def2(i, x_rotation_on_y);
    } else {
      var rotationValue = x_rotation_on_y *
          .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
      y = math.sin(i) * math.cos(rotationValue);
    }
    if (def3 != null) {
      z = def3(i, z_rotation_on_y);
    } else {
      var rotationValue = z_rotation_on_y *
          .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
      /// this must be the tan rotation
      z = math.tan(i) * math.sin(rotationValue);
    }

    // var someFromWidth = heightHalf * screenWidth + screenWidth * .1;

    // x mutliple half dimeter
    var xmhd = x *
        dimeterHalf *
        2; // "*2" to resolove the terminal screen width by height

    /// Width half
    var widthHalf = screenWidth * fromWidth;
    // purpose pixel
    var px = (xmhd + widthHalf);

    // y mutliple half dimeter
    var ymhd = y * dimeterHalf * 2;

    /// Height half
    var heightHalf = screenHeight * fromHeight;
    var realY = heightHalf + ymhd;
    // purpose pixel
    var py = screenWidth * realY.round();

    var zmhd = z *
        dimeterHalf *
        2; // "*2" to resolove the terminal screen width by height
    var pz = zmhd + widthHalf;

    int purposeIndex = (py + px).round();

    int seconderyIndex = (py + pz).round();

    try {
      if (rotated_on_x) {
        framPixels![purposeIndex] = char;
      } else {
        framPixels![purposeIndex] = char;
      }
      // framPixels![purposeIndex] = char;
      // if (z_rotation_on_y > 0 && z_rotation_on_y < 180) {
      //   framPixels[seconderyIndex] = '.';
      // }
    } catch (e) {
      // print(e);
    }
  }
}
