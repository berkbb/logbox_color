import 'package:ansicolor/ansicolor.dart';

/// Split extensions for string.
extension Split on String {
  ///* Info: Split long text to pieces controlled with chunk length.
  ///* Params: [chunkLength] is chunk length. Min  value is 1.
  ///* Returns: List<String>.
  ///* Notes:
  List<String> splitWithCount(int chunkLength) {
    if (isEmpty) {
      throw Exception("String is empty.");
    } // Empty.
    if (chunkLength < 1) {
      throw Exception("Chunk length is smaller than 1.");
    } // Smaller than 1.

    List<String> exportList = <String>[]; // return list.

    for (int i = 0; i < length; i = i + chunkLength) {
      if (chunkLength + i > length) {
        // If chunk length is bigger than text length.
        chunkLength = length - i; // Swap
      }
      String piece; // Print piece.
      try // Length is bigger than chunk
      {
        piece = substring(i, chunkLength + i); // Creating piece.
      } catch (e) // Length is smaller than chunk
      {
        piece = "null"; // If error, return 'null'.
      }

      exportList.add(piece); // Add to export list.
    }

    return exportList; // Return export list.
  }
}

/// Log level enum.
enum LogLevel {
  /// Verbose - yellow

  verbose,

  /// Debug - cyan.

  debug,

  /// Info - green.

  info,

  /// Warning -- yellow.

  warning,

  /// Error - red.

  error,

  /// Standart text print - white.

  unknown
}

///Convert extension on LogLevel
extension Convert on LogLevel {
  ///* Info:Get name from LogLevel enum.
  ///* Params: [this]
  ///* Returns: String.
  ///* Notes:
  String getStringFromPriorityType() {
    return toString().split('.').last; // Get last after .
  }

  ///* Info:Get enum type from String.
  ///* Params: [value] is name of enum.
  ///* Returns: Loglevel.
  ///* Notes:
  LogLevel getPriorityTypeFromString(String value) {
    value = 'LogLevel.$value'; // Combine enum type with name.
    return LogLevel.values.firstWhere((f) => f.toString() == value,
        orElse: () => LogLevel.unknown); // Find it.
  }

  ///* Info:Get enum with int id.
  ///* Params: [value] is id of enum.
  ///* Returns: Loglevel.
  ///* Notes:
  LogLevel getPriorityTypeFromInt(int value) {
    return LogLevel.values[value]; // Get type from int.
  }

  ///* Info: Get ANSI XTERM-256 color from log type.
  ///* Params: [this]
  ///* Returns: AnsiPen.
  ///* Notes: https://www.ditig.com/256-colors-cheat-sheet
  AnsiPen getColorPen() {
    var color = 253; // Grey 85
    switch (name) {
      case "verbose":
        color = 39; // 	DeepSkyBlue 1
        break;
      case "debug":
        color = 127; // Magenta 3
        break;
      case "info":
        color = 34; // Green 3
        break;
      case "warning":
        color = 172; // Orange 3
        break;
      case "error":
        color = 124; // Red 3
        break;
      case "unknown":
        color = 253; // Grey 85
        break;
    }

    return AnsiPen() // Return ansi term color.
      ..reset()
      ..xterm(color);
  }
}
