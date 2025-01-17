import 'dart:math' as math;
extension StrModification on String{
  String get obscureEmail{
    var emailBody = substring(0, indexOf('@'));
    String displayEmail = this;
    String starPortion = '';
    starPortion = emailBody.length > 6
        ? starPortion = emailBody.substring(3, emailBody.length - 3)
        : starPortion = emailBody.substring(1);
    displayEmail = replaceAll(
      starPortion,
      String.fromCharCodes(
        [for (var i = 0; i < starPortion.length; i++) '*'.codeUnits.first],
      ),
    );
    return displayEmail;
  }

  DateTime toDateTime(){
    var parts = split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);
    return DateTime(year,month,day);
  }
}

extension DoubleModification on double{
  bool get isZero => this == 0.0;
  bool get isGreaterThanZero => this > 0.0;
  double get degToRad => math.pi / 180 * this;
  double get radToDeg => 180 / math.pi * this;
}

extension IntegerModification on int{
  bool get isZero => this == 0.0;
  bool get isGreaterThanZero => this > 0.0;
  double get degToRad => math.pi / 180 * this;
  double get radToDeg => 180 / math.pi * this;
}

extension DateTimeModification on DateTime{
  String toKey(){
    return '$year-$month-$day';
  }
}