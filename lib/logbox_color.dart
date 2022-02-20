/// Support for doing something awesome.
///
/// More dartdocs go here.
library logbox_color;

import 'dart:io';

import 'package:logbox_color/extensions.dart';
import 'package:dart_console/dart_console.dart' as consolecontroller;

///* Info: Prints to console with color. Likestdout.writeLine() with colored foreground.
///* Params: [msg] is message, [lvl] is log level.
///* Returns: none.
///* Notes: Note that coloring only available on external OS terminals and Visual Studio and Visual Studio Code integrated terminal . Visual Studio and Visual Studio Code internalConsoke does not support coloring. Set dart.cliConsole to ecternalTerminal or terminal please.

void printLog(String msg, LogLevel lvl) {
  var console = consolecontroller.Console(); // Console instance.

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
  stdout.writeln("");
  //Empty space.

  StringBuffer title = StringBuffer(); // String buffer for title.
  var msgTitle = "⎧${lvl.getStringFromPriorityType()}⎫"; // Title
  var msgOut = " → $msg"; // Message

  // Write to title
  title.write(msgTitle);
  for (int i = 0; i < console.windowWidth - msgTitle.length - 1; i++) {
    title.write("⎯");
  }
  var upper = title.toString(); // Upper

  // Calculating the lines for long text.

  double divide = msgOut.length / console.windowWidth;
  int ceiledDivide = divide.ceil();
  int chunk = (msgOut.length / ceiledDivide - 1).toInt();

  //Print upper title.
  stdout.writeln(upper);

  if (divide <= 1) // If 0 (empty) or 1 line.
  {
    var printCount = console.windowWidth - msgOut.length; // Print count

    for (int i = 0; i < printCount - 1; i++) {
      if (i == 0) {
        stdout.write("⎮ $msgOut"); // Write message.
      } else if (i != printCount - 2) {
        stdout.write(" "); // Space
      } else {
        stdout.write("⎮"); // End plate.
      }
    }
    stdout.writeln(""); // New line.
  } else // 2 or more line.
  {
    var groups = msgOut.splitWithCount(chunk); // Split text into chunks.

    for (int i = 0; i < groups.length; i++) {
      var printer = StringBuffer(); // Strring buffer for a line.
      var startPrint = "⎮ ${groups[i]}"; // Message
      printer.write(startPrint); // Write message into buffer.
      var printCount = console.windowWidth - startPrint.length;
      for (var z = 0; z < printCount; z++) {
        if (z == printCount - 1) {
          printer.write("⎮"); // Write end plate into buffer.
        } else {
          printer.write(" "); // Write space into buffer.
        }
      }
      stdout.write(printer.toString()); // Print buffer.
      stdout.writeln(""); // New line.
    }
  }

  // Print footer.
  for (int i = 0; i < upper.length; i++) {
    stdout.write("⎯");
  }
  stdout.writeln("");
  //Empty space.

  // Reset foreground.
  console.setForegroundColor(consolecontroller.ConsoleColor.white);
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
