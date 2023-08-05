
import '../functions/colored_string.dart';
import '../methods/add_3d_Shape.dart';

D3Ball(
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
  add3DShape(
    def1: def1,
    def2: def2,
    char: coloredString('6', colorNumber: 36),
    x_rotation_on_y: y_rotation_on_x,
    y_rotation_on_x: x_rotation_on_y,
    z_rotation_on_y: z_rotation_on_y,
    rotated_on_x: rotated_on_x,
    rotated_on_y: rotated_on_y,
    framPixels: framPixels,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
  );
  add3DShape(
    def1: def1,
    def2: def2,
    char: coloredString('5', colorNumber: 35),
    // x_rotation_on_y: y_rotation_on_x * y_rotation_on_x,
    // y_rotation_on_x: y_rotation_on_x * y_rotation_on_x,
    z_rotation_on_y: z_rotation_on_y,
    rotated_on_x: rotated_on_x,
    rotated_on_y: rotated_on_y,
    framPixels: framPixels,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
  );
  add3DShape(
    def1: def1,
    def2: def2,
    char: coloredString('1', colorNumber: 31),
    x_rotation_on_y: y_rotation_on_x - 180,
    y_rotation_on_x: x_rotation_on_y - 180,
    z_rotation_on_y: z_rotation_on_y,
    rotated_on_x: rotated_on_x,
    rotated_on_y: rotated_on_y,
    framPixels: framPixels,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
  );
}
