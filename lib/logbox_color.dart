/// Support for doing something awesome.
///
/// More dartdocs go here.
library logbox_color;

import 'dart:io';

import 'package:logbox_color/extensions.dart';

///* Info: Prints to console with color. Likestdout.writeLine() with colored foreground.
///* Params: [msg] is message, [lvl] is log level.
///* Returns: none.
///* Notes: Note that coloring only available on external OS terminals and Visual Studio and Visual Studio Code integrated terminal . Visual Studio and Visual Studio Code internalConsoke does not support coloring. Set dart.cliConsole to ecternalTerminal or terminal please.

void printLog(String msg, LogLevel lvl) {
  var consoleNotTerminal =
      stdout.hasTerminal == false ? true : false; // Console or terminal.
  if (consoleNotTerminal) // Console
  {
    print(
        "${DateTime.now().toString()} --> ${lvl.getStringFromPriorityType()}\n---------------\n$msg\n---------------");
  } else // Terminal
  {
    var colorPen = lvl.getColorPen(); //Foreground selector.

    stdout.writeln("");
    // Empty space.

    StringBuffer title = StringBuffer(); // String buffer for title.
    var msgTitle =
        "⎧${DateTime.now().toString()} --> ${lvl.getStringFromPriorityType()}⎫"; // Title
    var msgOut = " → $msg"; // Message

    // Write to title
    title.write(msgTitle);
    for (int i = 0; i < stdout.terminalColumns - msgTitle.length - 1; i++) {
      title.write("⎯");
    }
    var upper = title.toString(); // Upper

    // Calculating the lines for long text.

    double divide = msgOut.length / stdout.terminalColumns;
    int ceiledDivide = divide.ceil();
    int chunk = (msgOut.length / ceiledDivide - 1).toInt();

    //Print upper title.
    stdout.writeln(colorPen(upper));

    if (divide <= 1) // If 0 (empty) or 1 line.
    {
      var printCount = stdout.terminalColumns - msgOut.length; // Print count

      for (int i = 0; i < printCount - 1; i++) {
        if (i == 0) {
          stdout.write(colorPen("⎮ $msgOut")); // Write message.
        } else if (i != printCount - 2) {
          stdout.write(" "); // Space
        } else {
          stdout.write(colorPen("⎮")); // End plate.
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
        var printCount = stdout.terminalColumns - startPrint.length;
        for (var z = 0; z < printCount; z++) {
          if (z == printCount - 1) {
            printer.write("⎮"); // Write end plate into buffer.
          } else {
            printer.write(" "); // Write space into buffer.
          }
        }
        stdout.write(colorPen(printer.toString())); // Print buffer.
        stdout.writeln(""); // New line.
      }
    }

    // Print footer.
    for (int i = 0; i < upper.length; i++) {
      stdout.write(colorPen("⎯"));
    }
    stdout.writeln("");
    //Empty space.
  }
}
