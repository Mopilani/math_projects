import 'dart:io';
import 'dart:math' as math;

import '../amaing_322.dart';
import 'functions/colored_string.dart';
import 'methods/add_3d_Shape.dart';
import 'utils/enums.dart';
import 'utils/extensions.dart';

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

  try {
    var y_rotation_value = 0;
    var x_rotation_value = 180;
    var y_clamping = true;
    var x_clamping = true;
    for (var i = 0; i < (loops ??= 4400); i++) {
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

      rotat_on_y(x, d) {
        var f = y_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around y axis
        // var val = (math.tan(x) + math.cos(f)) * math.cos(x) + math.tan(f);
        var val = math.cos(x) * math.sin(f);

        return val;
      }

      rotat_on_yw() {
        var f = y_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around y axis
        // var val = (math.tan(x) + math.cos(f)) * math.cos(x) + math.tan(f);
        var val = math.sin(f);

        return val;
      }

      rotat_on_xw() {
        var f = x_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around y axis
        // var val = (math.tan(x) + math.cos(f)) * math.cos(x) + math.tan(f);
        var val = math.sin(f);

        return val;
      }

      rotat_on_x(y, d) {
        var f = -y_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
        // var val = (math.tan(y) + math.cos(f)) * math.cos(y) + math.tan(f);
        var val = math.sin(y) * math.cos(f);
        return val;
      }

      yy(y, d) {
        // var f = -y_rotation_value *
        //     .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
        // var val = (math.tan(y) + math.cos(f)) * math.cos(y) + math.tan(f);
        var val = math.cos(y);
        return val;
      }

      xx(y, d) {
        var f = -y_rotation_value *
            .0088; // this ".00875 ~ " must be for to know the shape hade rotated 180 DEG around x axis
        // var val = (math.tan(y) + math.cos(f)) * math.cos(y) + math.tan(f);
        var val = math.sin(y) * math.cos(f);
        return val;
      }

      // specificCircle([int? dimeter]) {
      addShape(
        fromHeight:
            y_clamping ? rotat_on_yw() : rotat_on_xw(),
        fromWidth:
            y_clamping ? rotat_on_xw() : rotat_on_yw(),
        dimeterHalf: dimeter ??= 1,
        char: coloredString('0'),
        screenWidth: screenWidth,
        framPixels: framPixels,
        def1: yy,
        def2: xx,
        // rotated_on_x: x_clamping,
        // rotated_on_y: y_clamping,
        screenHeight: screenHeight,
      );
      // }

      // add3DShape(
      //   fromHeight:
      //       y_clamping ? rotat_on_xw() : rotat_on_yw().riseToThePower(2),
      //   fromWidth:
      //       y_clamping ? rotat_on_yw() : rotat_on_xw().riseToThePower(25),
      //   dimeterHalf: dimeter,
      //   char: coloredString('0', colorState: Colors.standerd),
      //   screenWidth: screenWidth,
      //   framPixels: framPixels,
      //   def1: xx,
      //   def2: yy,
      //   // rotated_on_x: x_clamping,
      //   // rotated_on_y: y_clamping,
      //   screenHeight: screenHeight,
      // );
      // add3DShape(
      //   fromHeight:
      //       y_clamping ? rotat_on_xw() : rotat_on_yw().riseToThePower(2),
      //   fromWidth:
      //       y_clamping ? rotat_on_xw() : rotat_on_yw().riseToThePower(25),
      //   dimeterHalf: dimeter,
      //   char: coloredString('0', colorState: Colors.standerd),
      //   screenWidth: screenWidth,
      //   framPixels: framPixels,
      //   def1: xx,
      //   def2: yy,
      //   // rotated_on_x: x_clamping,
      //   // rotated_on_y: y_clamping,
      //   screenHeight: screenHeight,
      // );
      // add3DShape(
      //   fromHeight:
      //       y_clamping ? rotat_on_yw() : rotat_on_xw().riseToThePower(3),
      //   fromWidth: y_clamping ? rotat_on_yw() : rotat_on_xw().riseToThePower(2),
      //   dimeterHalf: dimeter,
      //   char: coloredString('0', colorState: Colors.standerd),
      //   screenWidth: screenWidth,
      //   framPixels: framPixels,
      //   def1: xx,
      //   def2: yy,
      //   // rotated_on_x: x_clamping,
      //   // rotated_on_y: y_clamping,
      //   screenHeight: screenHeight,
      // );

      // math.sin(1).riseToThePower(999);

      // specificCircle(1);
      // specificCircle(2);
      // specificCircle(3);
      // specificCircle(4);
      // specificCircle(5);
      // specificCircle(6);
      // specificCircle(7);
      // specificCircle(8);

      fram = framPixels.join();
      render(fram);

      fram = ' ';
      filledFrame = fram * (screenWidth * screenHeight);
      framPixels = filledFrame.split('');
    }
  } catch (e) {
    print(e);
  }

  // fram = framPixels.join();
  // render(fram);
}
