double circleDef(x, y, d, h) {
  var fo = x - d;
  var fosqr = fo * fo;
  var so = y - h;
  var sosqr = so * so;

  var result = fosqr + sosqr;
  return result;
}