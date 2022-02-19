/// Support for doing something awesome.
///
/// More dartdocs go here.
library colorlogger;

import 'dart:io';

import 'package:colorlogger/extensions.dart';
import 'package:dart_console/dart_console.dart' as consolecontroller;

///* Info: Prints to console with color. Likestdout.writeLine() with colored foreground.
///* Params: [msg] is message, [lvl] is log level.
///* Returns: none.
///* Notes: ote that coloring only available on external OS terminals and Visual Studio and Visual Studio Code integrated terminal . Visual Studio and Visual Studio Code internalConsoke does not support coloring.

void printLog(String msg, LogLevel lvl) {
  var console = consolecontroller.Console();

  //Foreground selector.
  switch (lvl) {
    case LogLevel.verbose:
      console.setForegroundColor(consolecontroller.ConsoleColor.cyan);
      break;
    case LogLevel.debug:
      console.setForegroundColor(consolecontroller.ConsoleColor.magenta);
      break;
    case LogLevel.info:
      console.setForegroundColor(consolecontroller.ConsoleColor.green);
      break;
    case LogLevel.warning:
      console.setForegroundColor(consolecontroller.ConsoleColor.yellow);
      break;
    case LogLevel.error:
      console.setForegroundColor(consolecontroller.ConsoleColor.red);
      break;
    case LogLevel.unknown:
      console.setForegroundColor(consolecontroller.ConsoleColor.white);
      break;
  }

  StringBuffer title = StringBuffer(); // String buffer for title.
  var msgTitle = "⎧${lvl.getStringFromPriorityType()}⎫"; // Title
  var msgOut = " → $msg"; // Message

  // Write to title
  title.write(msgTitle);
  for (int i = 0; i < console.windowWidth - msgTitle.length - 1; i++) {
    title.write("⎯");
  }
  var upper = title.toString(); // Upper

  // Calculating the lines.

  double divide = msgOut.length / console.windowWidth;
  int ceiledDivide = divide.ceil();
  int chunk = (msgOut.length / ceiledDivide - 1) as int;

  //Print upper title.
  print(upper);

  if (divide <= 1) // If 0 (empty) or 1 line.
  {
    var printCount = console.windowWidth - msgOut.length;

    for (int i = 0; i < printCount - 1; i++) {
      if (i == 0) {
        stdout.write("⎮ $msgOut");
      } else if (i != printCount - 2) {
        stdout.write(" ");
      } else {
        stdout.write("⎮");
      }
    }
    print("");
  } else // 2 or more line.
  {
    var groups = msgOut.splitWithCount(chunk);

    for (int i = 0; i < groups!.length; i++) {
      var printCount = console.windowWidth;
      var startPrint = "⎮ ${groups[i]}";
      stdout.write(startPrint);
      var spaceCount = printCount - startPrint.length - 2;
      if (spaceCount != 0) // If will filled space available.
      {
        for (int z = 0; z < spaceCount; z++) {
          stdout.write(" ");
        }
      }

      stdout.write(" ⎮");

      print("");
    }
  }

  // Print footer.
  for (int i = 0; i < upper.length; i++) {
    stdout.write("⎯");
  }
  print(""); //Empty space.

  // Reset foreground.
  // console.setForegroundColor(consolecontroller.ConsoleColor.white);
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
