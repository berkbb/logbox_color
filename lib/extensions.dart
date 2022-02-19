import 'package:colorlogger/colorlogger.dart';

///
class Extensions {}

///
extension Split on String {
  ///* Info:
  ///* Params:
  ///* Returns:
  ///* Notes:
  List<String>? splitWithCount(int chunkLength) {
    if (isEmpty) throw Exception("String is empty.");
    if (chunkLength < 1) throw Exception("chunk length is smaller than 1.");

    for (int i = 0; i < length; i += chunkLength) {
      if (chunkLength + i > length) {
        chunkLength = length - i;
      }
    }
    return null;
  }
}

///
extension Convert on LogLevel {
  ///* Info:
  ///* Params:
  ///* Returns:
  ///* Notes:
  String getStringFromPriorityType() {
    return toString().split('.').last;
  }
}

///* Info:
///* Params:
///* Returns:
///* Notes:
LogLevel getPriorityTypeFromString(String value) {
  value = 'LogLevel.$value';
  return LogLevel.values
      .firstWhere((f) => f.toString() == value, orElse: () => LogLevel.unknown);
}

///* Info:
///* Params:
///* Returns:
///* Notes:
LogLevel getPriorityTypeFromInt(int value) {
  return LogLevel.values[value];
}
