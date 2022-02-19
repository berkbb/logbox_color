import 'package:logbox_color/logbox_color.dart';

/// Split extensions for string.
extension Split on String {
  ///* Info: Split long text to pieces controlled with chunk length.
  ///* Params: [chunkLength] is chunk length. Min  value is 1.
  ///* Returns: List<String>.
  ///* Notes:
  List<String> splitWithCount(int chunkLength) {
    if (isEmpty) throw Exception("String is empty.");
    if (chunkLength < 1) throw Exception("Chunk length is smaller than 1.");

    List<String> exportList = <String>[];

    for (int i = 0; i < length; i = i + chunkLength) {
      if (chunkLength + i > length) {
        chunkLength = length - i;
      }
      String piece;
      try // Length is bigger than chunk
      {
        piece = substring(i, chunkLength + i);
      } catch (e) // Length is smaller than chunk
      {
        piece = "null";
      }

      exportList.add(piece);
    }

    return exportList;
  }
}

///Convert extension on LogLevel
extension Convert on LogLevel {
  ///* Info:Get name from LogLevel enum.
  ///* Params: this
  ///* Returns: String.
  ///* Notes:
  String getStringFromPriorityType() {
    return toString().split('.').last;
  }
}

///* Info:Get enum type from String.
///* Params: [value] is name of enum.
///* Returns: Loglevel.
///* Notes:
LogLevel getPriorityTypeFromString(String value) {
  value = 'LogLevel.$value';
  return LogLevel.values
      .firstWhere((f) => f.toString() == value, orElse: () => LogLevel.unknown);
}

///* Info:Get enum with int id.
///* Params: [value] is id of enum.
///* Returns: Loglevel.
///* Notes:
LogLevel getPriorityTypeFromInt(int value) {
  return LogLevel.values[value];
}
