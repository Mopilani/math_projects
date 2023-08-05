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
