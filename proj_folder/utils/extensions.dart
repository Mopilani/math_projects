extension RaiseTO on num {
  num riseToThePower(num power) {
    var r = this;
    for (var i = 0; i < power; i++) {
      r = r * this;
    }
    return r;
  }
}
